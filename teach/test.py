import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import chi2_contingency
from matplotlib.font_manager import FontProperties
import numpy as np

font_path = r'C:\Windows\Fonts\msjhl.ttc'  
font_prop = FontProperties(fname=font_path)

# 读取你的 CSV 文件
df = pd.read_csv('merge.csv', encoding='cp950', na_values=['  '])
df['受傷數量'] = np.where(df['受傷數量'] >= 1, 1, 0)

# 选择两个分类变量的列名
variable1 = '飲酒情形'
variable2 = '光線'

# 创建交叉表
cross_table = pd.crosstab(df[variable1], df[variable2])

# 进行卡方检验
chi2, _, _, _ = chi2_contingency(cross_table)

# 计算 Cramér's V
num_obs = cross_table.sum().sum()
cramers_v = np.sqrt(chi2 / num_obs)

# 打印卡方统计量和 Cramér's V
print(f"Chi2 Statistic: {chi2}")
print(f"Cramér's V: {cramers_v}")

# 绘制卡方统计图
plt.figure(figsize=(8, 6))
plt.imshow(cross_table, cmap='Blues', interpolation='none')
plt.colorbar(label='Count')
plt.title(f'Chi-Square Test: {variable1} vs {variable2}\nCramér\'s V: {cramers_v:.3f}', fontproperties=font_prop)
plt.xlabel(variable2, fontproperties=font_prop)
plt.ylabel(variable1, fontproperties=font_prop)

# 显示 x, y 轴标签
plt.xticks(range(len(cross_table.columns)), cross_table.columns, rotation=90, fontproperties=font_prop)
plt.yticks(range(len(cross_table.index)), cross_table.index, fontproperties=font_prop)

# 在图中显示每个单元格中的数字
for i in range(len(cross_table.index)):
    for j in range(len(cross_table.columns)):
        plt.text(j, i, cross_table.iloc[i, j], ha='center', va='center', color='black', fontproperties=font_prop)

# 显示图形
plt.show()
