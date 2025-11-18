import yfinance as yf
import pandas as pd
def fetch_company_data(tickers, filename="company_data.csv"):
    """Fetch key financial info for a list of tickers and save to CSV."""
    records = []
    for ticker in tickers:
        dat = yf.Ticker(ticker)
        info = dat.get_info()   
        # Extract relevant fields safely
        record = {
            "Ticker": ticker,
            "MarketCap": info.get("marketCap"),
            "Volume": info.get("volume"),
            "RevenueGrowth": info.get("revenueGrowth"),
            "NetIncomeToCommon": info.get("netIncomeToCommon"),
            "Industry": info.get("industry"),
            "Exchange": info.get("exchange"),
            "Employees": info.get("fullTimeEmployees", "N/A"),
            "IPO": dat.history(period="max").index[0].date() if not dat.history(period="max").empty else "N/A"
        }
        records.append(record)
    df = pd.DataFrame(records)
    df.to_csv(filename, index=False)
    print(f"✅ Saved data for {len(tickers)} companies to '{filename}'")
    return df
companies = ["NVDA", "AAPL", "MSFT", "GOOGL"]
df = fetch_company_data(companies)
df.head()
