import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
from matplotlib.lines import Line2D

markdown = """
| Compiler | Backend | Flags | Compile (s) | Run (s) |
|----------|---------|-------|-------------|---------|
| myc | llvm |  | 0.9517 | 60.8659 |
| myc | llvm | --final | 2.1303 | 52.1698 |
| myc | c |  | 2.0052 | 57.2753 |
| myc | c | --final | 2.7303 | 52.9724 |
| myc | gm |  | 0.3672 | 58.0253 |
| myc | gm | --final | 0.4762 | 52.9365 |
| myc | qbe |  | 0.3538 | 77.6315 |
| clang | llvm | -O0 | 0.1992 | 139.3654 |
| clang | llvm | -O1 | 1.4527 | 54.6307 |
| clang | llvm | -O2 | 1.822 | 52.2354 |
| clang | llvm | -O3 | 1.8795 | 52.001 |
"""

lines = markdown.strip().split('\n')
data = []
for line in lines[2:]:
    parts = [p.strip() for p in line.split('|') if p.strip()]
    if len(parts) < 4:
        continue
    compiler, backend = parts[0], parts[1]
    try:
        compile_time = float(parts[-2])
        runtime = float(parts[-1])
    except ValueError:
        continue
    flags_str = ' '.join(parts[2:-2])
    label_parts = [compiler]
    if backend and backend != '-':
        label_parts.append(backend)
    if flags_str:
        label_parts.append(flags_str)
    name = ' '.join(label_parts)
    data.append((name, compile_time, runtime))

colors = [
    '#FF6B6B', '#FF8E8E',
    '#FFA07A', '#FFB347',
    '#E74C3C', '#E67E22',
    '#D35400', '#F39C12',
    '#4ECDC4', '#45B7AA', '#3AAFA0', '#2E8B7F',
    '#9B59B6', '#A569BD', '#B07CC6', '#8E44AD',
    '#2ECC71',
]

fig, ax = plt.subplots(figsize=(14, 9), dpi=100)
fig.patch.set_facecolor('#1a1a2e')
ax.set_facecolor('#1a1a2e')

x_coords = [item[1] for item in data]
y_coords = [item[2] for item in data]
labels = [name for name, _, _ in data]

for i, (x, y) in enumerate(zip(x_coords, y_coords)):
    ax.scatter(x, y, c=colors[i], s=250, edgecolors='white', linewidth=1.2, zorder=5)

# Логарифмическая шкала по Y
ax.set_yscale('log')

# Обычные числа на оси Y вместо степеней 10^n
ax.yaxis.set_major_formatter(mticker.FuncFormatter(lambda v, _: f'{v:g}'))
ax.yaxis.set_minor_formatter(mticker.NullFormatter())

# Явные «круглые» метки по Y (подобраны под этот датасет)
ax.yaxis.set_major_locator(mticker.FixedLocator([50, 60, 70, 80, 90, 100, 120, 140]))

ax.set_xlim(0, 3)

for x, y, label in zip(x_coords, y_coords, labels):
    if label == 'clang llvm -O3':
        offset, va = (0, -12), 'top'
    else:
        offset, va = (0, 12), 'bottom'
    ax.annotate(
        label,
        (x, y),
        xytext=offset, textcoords="offset points",
        ha='center', va=va,
        fontsize=8, color='white',
        zorder=6,
    )

ax.set_xlabel('Compile time (seconds)', color='white', fontsize=14)
ax.set_ylabel('Runtime (seconds, log scale)', color='white', fontsize=14)
ax.tick_params(colors='white', labelsize=11)
ax.spines['bottom'].set_color('gray')
ax.spines['left'].set_color('gray')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.grid(True, alpha=0.15, color='white', which='major')

legend_elements = []
for i, (name, _, _) in enumerate(data):
    legend_elements.append(Line2D([0], [0], marker='o', color='w',
                                  markerfacecolor=colors[i],
                                  markersize=10, label=name))

ax.legend(handles=legend_elements, loc='upper right', facecolor='#2d2d44',
          edgecolor='gray', labelcolor='white', fontsize=9, ncol=1)

ax.set_title('IR compilers on index-c benchmark: compile time vs. runtime for IR',
             color='white', fontsize=16, fontweight='bold', pad=25)

plt.tight_layout()
plt.savefig('plot2.png', dpi=150, facecolor='#1a1a2e', bbox_inches='tight')
plt.close(fig)