import matplotlib.pyplot as plt
import re
import textalloc as ta

markdown = """
| Compiler | Compile time | Runtime |
|:-------|-------------:|-----:|
| mycc(default, llvm) | 2713ms | 60.4s |
| mycc(final, llvm) | 3669ms | 53.6s |
| mycc(default, qbe) | 2442ms | 68.5s |
| mycc(default, c, clang) | 4471ms | 59.5s |
| mycc(final, c, clang) | 4920ms | 52.0s |
| clang(-O3, c) | 3042ms | 51.8s |
| clang(-O2, c) | 3001ms | 52.0s |
| clang(-O1, c) | 2739ms | 54.2s |
| clang(-O0, c) | 1605ms | 141.1s |
| gcc(-O3, c) | 3470ms | 52.4s |
| gcc(-O2, c) | 2986ms | 54.7s |
| gcc(-O1, c) | 2143ms | 58.0s |
| gcc(-O0, c) | 1304ms | 134.9s |
| cproc | 726ms | 72.8s |
"""

lines = markdown.strip().split('\n')
data = []
for line in lines[2:]:
    parts = [p.strip() for p in line.split('|') if p.strip()]
    if len(parts) >= 3:
        name = parts[0]
        compile_time = int(re.search(r'(\d+)', parts[1]).group(1))
        runtime = float(re.search(r'([\d.]+)', parts[2]).group(1))
        data.append((name, compile_time, runtime))

colors = [
    '#3498DB', '#2980B9',
    '#1ABC9C', '#16A085',
    '#0E6655',
    '#E74C3C', '#EC7063', '#F1948A', '#F5B7B1',
    '#2ECC71', '#58D68D', '#82E0AA', '#A9DFBF',
    '#8E44AD',
]

fig, ax = plt.subplots(figsize=(8, 5), dpi=100)
fig.patch.set_facecolor('#1a1a2e')
ax.set_facecolor('#1a1a2e')

x_coords = [item[1] for item in data]
y_coords = [item[2] for item in data]
labels = [name.replace(', ll', '').replace(', clang', '') for name, _, _ in data]

for i, (x, y) in enumerate(zip(x_coords, y_coords)):
    ax.scatter(x, y, c=colors[i], s=180, edgecolors='white', linewidth=0.8, zorder=5)

ax.set_xlim(0, 4500)
ax.set_ylim(0, 150)

ta.allocate(
    ax,
    x_coords, y_coords, labels,
    x_scatter=x_coords, y_scatter=y_coords,
    textsize=9,
    draw_lines=True,
    linecolor='gray',
    linewidth=0.5,
    max_distance=0.3,
    min_distance=0.05,
    margin=0.02,
    fontfamily='monospace',
    bbox=dict(boxstyle='round,pad=0.3', facecolor='#2d2d44', edgecolor='#555', alpha=0.9)
)

for text_obj in ax.texts:
    text_obj.set_color('white')
    text_obj.set_fontweight('bold')

ax.set_xlabel('Compile time (ms)', color='white', fontsize=12)
ax.set_ylabel('Runtime (seconds)', color='white', fontsize=12)
ax.tick_params(colors='white')
ax.spines['bottom'].set_color('gray')
ax.spines['left'].set_color('gray')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.grid(True, alpha=0.15, color='white')

ax.annotate('← faster compile', xy=(0.02, 0.02), xycoords='axes fraction', 
            color='white', fontsize=10, alpha=0.7)
ax.annotate('↓ faster runtime', xy=(0.02, 0.95), xycoords='axes fraction', 
            color='white', fontsize=10, alpha=0.7)

from matplotlib.lines import Line2D
legend_elements = []
legend_names = ["clang -O3", "clang -O2", "clang -O1", "clang -O0",
                "myc-llvm(default)", "myc-llvm(final)",
                "myc-qbe(default)",
                "myc-c(default)", "myc-c(final)"]
for i, name in enumerate(legend_names):
    legend_elements.append(Line2D([0], [0], marker='o', color='w', markerfacecolor=colors[i],
                                  markersize=10, label=name))

ax.legend(handles=legend_elements, loc='upper right', facecolor='#2d2d44',
          edgecolor='gray', labelcolor='white', fontsize=8, ncol=1)

ax.set_title('LangArena benchmark: pure IR compile, myc vs clang',
             color='white', fontsize=14, fontweight='bold', pad=20)

plt.tight_layout()
plt.savefig('plot2.png', dpi=100, facecolor='#1a1a2e')
plt.show()
