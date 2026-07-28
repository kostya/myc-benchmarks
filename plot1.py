import matplotlib.pyplot as plt
import re
import textalloc as ta

markdown = """
| Compiler | Compile time | Runtime |
|:-------|-------------:|-----:|
| clang(-O3, ll) | 1603ms | 52.1s |
| clang(-O2, ll) | 1572ms | 52.6s |
| clang(-O1, ll) | 1286ms | 55.4s |
| clang(-O0, ll) | 193ms | 139.0s |
| myc-llvm(default) | 889ms | 59.6s |
| myc-llvm(final) | 1880ms | 52.8s |
| myc-qbe(default) | 262ms | 68.3s |
| myc-c(default, clang) | 1589ms | 60.6s |
| myc-c(final, clang) | 3115ms | 53.3s |
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
    '#FF6B6B', '#FF8E8E', '#FFA07A', '#FFB3B3',
    '#4ECDC4', '#45B7AA',
    '#2ECC71',
    '#9B59B6', '#A569BD',
]

fig, ax = plt.subplots(figsize=(12, 8), dpi=100)
fig.patch.set_facecolor('#1a1a2e')
ax.set_facecolor('#1a1a2e')

x_coords = [item[1] for item in data]
y_coords = [item[2] for item in data]
labels = [name.replace(', ll', '').replace(', clang', '') for name, _, _ in data]

for i, (x, y) in enumerate(zip(x_coords, y_coords)):
    ax.scatter(x, y, c=colors[i], s=250, edgecolors='white', linewidth=1.2, zorder=5)

ax.set_xlim(0, 3800)
ax.set_ylim(40, 150)

ta.allocate(
    ax,
    x_coords, y_coords, labels,
    x_scatter=x_coords, y_scatter=y_coords,
    textsize=12,
    draw_lines=True,
    linecolor='gray',
    linewidth=0.8,
    max_distance=0.1,
    min_distance=0.08,
    margin=0.03,
    fontfamily='monospace',
    bbox=dict(boxstyle='round,pad=0.4', facecolor='#2d2d44', edgecolor='#555', alpha=0.9)
)

for text_obj in ax.texts:
    text_obj.set_color('white')
    text_obj.set_fontweight('bold')

ax.set_xlabel('Compile time (ms)', color='white', fontsize=14)
ax.set_ylabel('Runtime (seconds)', color='white', fontsize=14)
ax.tick_params(colors='white', labelsize=11)
ax.spines['bottom'].set_color('gray')
ax.spines['left'].set_color('gray')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.grid(True, alpha=0.15, color='white')

from matplotlib.lines import Line2D
legend_elements = []
legend_names = ["clang -O3", "clang -O2", "clang -O1", "clang -O0",
                "myc-llvm(default)", "myc-llvm(final)",
                "myc-qbe(default)",
                "myc-c(default)", "myc-c(final)"]
for i, name in enumerate(legend_names):
    legend_elements.append(Line2D([0], [0], marker='o', color='w', markerfacecolor=colors[i],
                                  markersize=12, label=name))

ax.legend(handles=legend_elements, loc='upper right', facecolor='#2d2d44',
          edgecolor='gray', labelcolor='white', fontsize=10, ncol=1)

ax.set_title('LangArena benchmark: Pure IR Compilation - Myc vs Clang',
             color='white', fontsize=16, fontweight='bold', pad=25)

plt.tight_layout()
plt.savefig('plot1.png', dpi=150, facecolor='#1a1a2e', bbox_inches='tight')
plt.show()