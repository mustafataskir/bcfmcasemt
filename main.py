#Kütüphaneler
from fastapi import FastAPI
import uvicorn
import requests

#api çağırma
app = FastAPI()

#Kök klasörüne Get metodu atama
@app.get("/")
def write_name():
    return {"ad":"Mustafa", "soyad":"Taskir"}

#OpenWeather sitesinin apisinden çekilen veriyi ayıkladık.
@app.get("/temperature")
def get_temp(city: str):
    response = requests.get(f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid=b91cd83aee0b0596069a94e434dd49b0&units=metric")
    return {"temperature": response.json()["main"]["temp"]}

#programı çalıştırma
#uvicorn.run(app, host='0.0.0.0', port=5000)
