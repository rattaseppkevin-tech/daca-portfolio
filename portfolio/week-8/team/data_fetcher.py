# ROLL: API Query (Andmete pärimine)
# UrbanStyle OÜ — Supabase andmete pärimine
# Väljund: 3 funktsiooni, mis tagastavad DataFrame'e
 
import pandas as pd
from supabase import create_client, Client
from dotenv import load_dotenv
import os
 
# Samm 1: Lae .env fail ja loo Supabase client
load_dotenv()
 
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")
 
try:
    supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
    print("Supabase ühendus loodud.")
except Exception as e:
    print(f"Viga Supabase ühenduse loomisel: {e}")
    print("Kontrolli .env failis SUPABASE_URL ja SUPABASE_KEY väärtusi.")
 
 
# Samm 2: Müügiandmete pärimine kuupäevafiltritega
def fetch_sales(start_date: str, end_date: str) -> pd.DataFrame:
    """
    Pärib müügiandmed Supabase'ist vahemikus start_date kuni end_date.
    
    Parameetrid:
        start_date (str): Alguskuupäev formaadis 'YYYY-MM-DD'
        end_date   (str): Lõppkuupäev formaadis 'YYYY-MM-DD'
    
    Tagastab:
        pd.DataFrame: Müügiandmed
    """
    try:
        response = (
            supabase.table("sales")
            .select("*")
            .gte("sale_date", start_date)
            .lte("sale_date", end_date)
            .execute()
        )
        df_sales = pd.DataFrame(response.data)
        
        if df_sales.empty:
            print("Hoiatus: fetch_sales tagastas tühja DataFrame. Kontrolli kuupäevavahemikku.")
        
        return df_sales
 
    except Exception as e:
        print(f"Viga müügiandmete pärimisel: {e}")
        print("Kontrolli API tunnuseid ja andmebaasi ühendust.")
        return pd.DataFrame()
 
 
# Samm 3: Kliendiandmete pärimine
def fetch_customers() -> pd.DataFrame:
    """
    Pärib kõik kliendiandmed Supabase'ist.
    
    Tagastab:
        pd.DataFrame: Kliendiandmed
    """
    try:
        response = (
            supabase.table("customers")
            .select("*")
            .execute()
        )
        df_customers = pd.DataFrame(response.data)
        
        if df_customers.empty:
            print("Hoiatus: fetch_customers tagastas tühja DataFrame.")
        
        return df_customers
 
    except Exception as e:
        print(f"Viga kliendiandmete pärimisel: {e}")
        print("Kontrolli API tunnuseid ja andmebaasi ühendust.")
        return pd.DataFrame()
 
 
# Samm 3: Tooteandmete pärimine
def fetch_products() -> pd.DataFrame:
    """
    Pärib kõik tooteandmed Supabase'ist.
    
    Tagastab:
        pd.DataFrame: Tooteandmed
    """
    try:
        response = (
            supabase.table("products")
            .select("*")
            .execute()
        )
        df_products = pd.DataFrame(response.data)
        
        if df_products.empty:
            print("Hoiatus: fetch_products tagastas tühja DataFrame.")
        
        return df_products
 
    except Exception as e:
        print(f"Viga tooteandmete pärimisel: {e}")
        print("Kontrolli API tunnuseid ja andmebaasi ühendust.")
        return pd.DataFrame()
 
 
# Samm 5: Testi kõiki funktsioone
if __name__ == "__main__":
 
    print("\n=== MÜÜGIANDMED ===")
    df_sales = fetch_sales("2024-01-01", "2025-02-28")
    print("Ridade arv:", len(df_sales))
    print(df_sales.head())
 
    print("\n=== KLIENDIANDMED ===")
    df_customers = fetch_customers()
    print("Ridade arv:", len(df_customers))
    print(df_customers.head())
 
    print("\n=== TOOTEANDMED ===")
    df_products = fetch_products()
    print("Ridade arv:", len(df_products))
    print(df_products.head())