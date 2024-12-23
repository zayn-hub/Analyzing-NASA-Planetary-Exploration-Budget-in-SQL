
## Bar plot of total cost vs year, colored by destination


import plotly.express as px 
import pandas as pd
df = pd.read_csv(r'C:\Users\zayn al Abidin\OneDrive\Documents\total_cost_by_year_1.csv')
##print(df)

fig = px.bar(
    df,
    x = 'fiscal_year',
    y = 'adjusted_total_cost_musd',
    color = "destination"
)
fig.show()