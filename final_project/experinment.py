import yfinance as yf

dat = yf.Ticker('NVDA')
'''
Needed variable names for us:
    marketCap, 
    volume, 
    revenueGrowth, 
    netIncomeToCommon, 
    IPO (go manual), 
    Employee (go manual)
    industry
    exchange
'''
for key in sorted(dat.info.keys()):
    print(key)

attributes = [
    'marketCap', 
    'volume', 
    'revenueGrowth', 
    'netIncomeToCommon',  
    'industry',
    'exchange'
]

for key in attributes:
    print(f"{key}: {dat.info[key]}")

data_example = yf.download("NVDA", period="1mo")
data_example.to_csv("/Users/gafurmammadov/Documents/Uchicago_classes/DB/final_project/example_price_data.csv")