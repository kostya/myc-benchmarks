import re
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D

markdown = """
| IR | Compiler | IR size, Kb | Compile time | Run time |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| llvm-ll | clang(-O3) | 1529 | 1160ms | 636ms |
| myc | myc-llvm(default) | 486 | 216ms | 683ms |
| myc | myc-llvm(final) | 486 | 1159ms | 621ms |
| qbe-ssa | qbe + clang(as+linker) | 345 | 78ms + 49ms | 811ms |
| myc | myc-qbe(default) | 486 | 497ms | 851ms |
| c | clang(-O3) | 128 | 1224ms | 626ms |
| myc | myc-c(default) | 486 | 961ms | 673ms |
| myc | myc-c(final) | 486 | 1352ms | 667ms |
| lowir | cppgm++ | 1157 | 106ms | 691ms |
| myc | myc-gm(default) | 486 | 126ms | 692ms |
| myc | myc-gm(final) | 486 | 170ms | 664ms |
"""

def parse_time_ms(s):
    nums = re.findall(r'([\d.]+)\s*(ms|s)?', s)
    total = 0.0
    for num, unit in nums:
        v = float(num)
        if unit == 's':
            v *= 1000.0
        total += v
    return total

lines = markdown.strip().split('\n')
data = []
for line in lines[2:]:
    parts = [p.strip() for p in line.split('|') if p.strip()]
    if len(parts) < 5:
        continue
    ir, compiler, ir_size, compile_raw, run_raw = parts[:5]
    compile_ms = parse_time_ms(compile_raw)
    run_ms = parse_time_ms(run_raw)
    ir_size_kb = float(ir_size)
    label = f"{compiler} [{ir}]"
    data.append((label, compile_ms, run_ms, ir_size_kb))

def color_for(compiler):
    c = compiler.lower()
    if c.startswith('clang'):
        return '#4ECDC4'
    if c.startswith('cppgm'):
        return '#2ECC71'
    if c.startswith('qbe'):
        return '#F39C12'
    if c.startswith('myc-llvm'):
        return '#FF6B6B'
    if c.startswith('myc-qbe'):
        return '#D35400'
    if c.startswith('myc-gm'):
        return '#9B59B6'
    if c.startswith('myc-c'):
        return '#FFA07A'
    return '#A569BD'

colors = [color_for(name.split(' [')[0]) for name, *_ in data]

fig, ax = plt.subplots(figsize=(14, 9), dpi=100)
fig.patch.set_facecolor('#1a1a2e')
ax.set_facecolor('#1a1a2e')

x_coords = [item[1] for item in data]
y_coords = [item[2] for item in data]
labels = [name for name, *_ in data]

for i, (x, y) in enumerate(zip(x_coords, y_coords)):
    ax.scatter(x, y, c=colors[i], s=250, edgecolors='white', linewidth=1.2, zorder=5)

ax.set_xlim(0, max(x_coords) * 1.15 + 50)
ax.set_ylim(min(y_coords) - 60, max(y_coords) + 70)

BOTTOM_LABELS = {
    'clang(-O3) [llvm-ll]',
    'myc-gm(final) [myc]',
    'myc-c(final) [myc]',
}
X_OFFSET = {
    'myc-gm(default) [myc]': (-10, 0),
    'myc-gm(final) [myc]':   (10, 0),
}

for x, y, label in zip(x_coords, y_coords, labels):
    if label in BOTTOM_LABELS:
        offset, va = (X_OFFSET.get(label, (0, 0))[0], -12), 'top'
    else:
        offset, va = (X_OFFSET.get(label, (0, 0))[0], 12), 'bottom'
    ax.annotate(
        label,
        (x, y),
        xytext=offset, textcoords="offset points",
        ha='center', va=va,
        fontsize=8, color='white',
        zorder=6,
    )

ax.set_xlabel('Compile time (ms)', color='white', fontsize=14)
ax.set_ylabel('Run time (ms)', color='white', fontsize=14)
ax.tick_params(colors='white', labelsize=11)
ax.spines['bottom'].set_color('gray')
ax.spines['left'].set_color('gray')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.grid(True, alpha=0.15, color='white')

seen, legend_elements = set(), []
for i, (name, *_ ) in enumerate(data):
    compiler = name.split(' [')[0]
    family = compiler.split('(')[0]
    if family in seen:
        continue
    seen.add(family)
    legend_elements.append(Line2D([0], [0], marker='o', color='w',
                                  markerfacecolor=colors[i],
                                  markersize=10, label=compiler))

ax.legend(handles=legend_elements, loc='upper right', facecolor='#2d2d44',
          edgecolor='gray', labelcolor='white', fontsize=9, ncol=1)

ax.set_title('Brainfuck compiler 4 backends vs myc proxy',
             color='white', fontsize=16, fontweight='bold', pad=25)

plt.tight_layout()
plt.savefig('plot3.png', dpi=150, facecolor='#1a1a2e', bbox_inches='tight')
plt.close(fig)