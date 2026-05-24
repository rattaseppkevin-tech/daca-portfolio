from supabase import create_client
 
# Asenda oma Supabase andmetega (Connect > API Keys)
url = "https://cwgauehigbgiowmvgwcx.supabase.co"
key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN3Z2F1ZWhpZ2JnaW93bXZnd2N4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQzNTczNTQsImV4cCI6MjA4OTkzMzM1NH0.bpB7xia71dbauMApLxmFvImAe1EPsjl-Sh5R8tSYC-k"
 
supabase = create_client(url, key)
 
# Asenda oma tabeli nimega (nt 'test_sales' või 'team_members')

response = supabase.table('team_members').select("*").execute()
 
print(f"Leitud ridu: {len(response.data)}")
for row in response.data:
    print(row)
