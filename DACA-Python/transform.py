# ROLL: Data Processing (Andmete töötlemine)
# UrbanStyle OÜ — andmete transformeerimisfunktsioonid
# Väljund: 4 funktsiooni andmete töötlemiseks

import pandas as pd


# Samm 1: Andmete puhastamine
def clean_data(df: pd.DataFrame) -> pd.DataFrame:
    """
    Puhastab DataFrame'i: eemaldab duplikaadid, käsitleb NULL-id,
    teisendab kuupäevad datetime formaati.

    Parameeter:
        df (pd.DataFrame): Toores sisendandmestik

    Tagastab:
        pd.DataFrame: Puhastatud andmestik
    """
    print("--- clean_data() ---")
    print("Algne ridade arv:", df.shape[0])

    # Eemalda duplikaadid
    duplikaadid = df.duplicated().sum()
    df = df.drop_duplicates()
    print(f"Eemaldatud duplikaadid: {duplikaadid}")

    # Käsitle NULL väärtused
    print("NULL väärtused enne puhastamist:\n", df.isnull().sum())
    df = df.dropna(subset=['customer_id', 'sale_date', 'total_price'])

    # Teisenda kuupäevad datetime formaati (vihje järgi)
    df['sale_date'] = pd.to_datetime(df['sale_date'])

    # Eemalda negatiivsed hinnad
    df = df[df['total_price'] > 0]

    print("Lõplik ridade arv:", df.shape[0])
    return df


# Samm 2: Nädalased koondnäitajad
def calculate_weekly_aggregates(df: pd.DataFrame) -> pd.DataFrame:
    """
    Grupeerib andmed nädalate kaupa ja arvutab
    tulu, tellimuste arvu ja keskmise tellimuse väärtuse.

    Parameeter:
        df (pd.DataFrame): Puhastatud müügiandmestik

    Tagastab:
        pd.DataFrame: Nädalased koondnäitajad
    """
    print("--- calculate_weekly_aggregates() ---")

    # Kasutame resample('W') nagu vihje ette näeb
    weekly = df.resample('W', on='sale_date').agg(
        tulu=('total_price', 'sum'),
        tellimuste_arv=('sale_id', 'count'),
        keskmine_tellimus=('total_price', 'mean')
    ).reset_index()

    weekly['keskmine_tellimus'] = weekly['keskmine_tellimus'].round(2)

    print(f"Nädalaid kokku: {len(weekly)}")
    print(weekly.head())
    return weekly


# Samm 3: KPI-de arvutamine
def calculate_kpis(df: pd.DataFrame) -> dict:
    """
    Arvutab peamised ärinäitajad (KPI-d).

    Parameeter:
        df (pd.DataFrame): Puhastatud müügiandmestik

    Tagastab:
        dict: Vähemalt 3 KPI meetrikat
    """
    print("--- calculate_kpis() ---")

    kpis = {
        'total_revenue':    round(df['total_price'].sum(), 2),
        'unique_customers': df['customer_id'].nunique(),
        'avg_order_value':  round(df['total_price'].mean(), 2),
        'total_orders':     len(df),
        'best_month':       df.groupby(df['sale_date'].dt.to_period('M'))['total_price']
                              .sum().idxmax()
    }

    print("KPI-d:")
    for k, v in kpis.items():
        print(f"  {k}: {v}")

    return kpis


# Samm 4: Andmestike liitmine
def merge_datasets(df_sales: pd.DataFrame, df_customers: pd.DataFrame) -> pd.DataFrame:
    """
    Liidab müügi- ja kliendiandmed customer_id järgi.

    Parameetrid:
        df_sales     (pd.DataFrame): Müügiandmestik
        df_customers (pd.DataFrame): Kliendiandmestik

    Tagastab:
        pd.DataFrame: Liidatud andmestik
    """
    print("--- merge_datasets() ---")

    df_merged = pd.merge(df_sales, df_customers, on='customer_id', how='left')

    print("Liidatud andmestiku shape:", df_merged.shape)
    print("Veerud:", list(df_merged.columns))

    puuduvad = df_merged['customer_id'].isnull().sum()
    if puuduvad > 0:
        print(f"Hoiatus: {puuduvad} real puudub customer_id pärast liitmist.")

    return df_merged


# Samm 5: Testi kõiki funktsioone näidisandmetega
if __name__ == "__main__":

    # Näidisandmed testimiseks
    df_sales_test = pd.DataFrame({
        'sale_id':     [1, 2, 3, 3, 5],
        'customer_id': [101, 102, 103, 103, None],
        'sale_date':   ['2024-06-01', '2024-06-08', '2024-06-15', '2024-06-15', '2024-06-22'],
        'total_price': [120.0, -50.0, 200.0, 200.0, 80.0]
    })

    df_customers_test = pd.DataFrame({
        'customer_id': [101, 102, 103],
        'email':       ['alice@example.com', 'bob@example.com', 'carol@example.com'],
        'name':        ['Alice', 'Bob', 'Carol']
    })

    print("\n========== TEST: clean_data() ==========")
    df_clean = clean_data(df_sales_test)

    print("\n========== TEST: calculate_weekly_aggregates() ==========")
    df_weekly = calculate_weekly_aggregates(df_clean)

    print("\n========== TEST: calculate_kpis() ==========")
    kpis = calculate_kpis(df_clean)

    print("\n========== TEST: merge_datasets() ==========")
    df_merged = merge_datasets(df_clean, df_customers_test)
    print(df_merged.head())
