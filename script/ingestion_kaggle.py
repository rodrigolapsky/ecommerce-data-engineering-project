import zipfile
from pathlib import Path
from kaggle.api.kaggle_api_extended import KaggleApi
from google.cloud import storage

bucket_name = "project-ecommerce" 
dataset = "olistbr/brazilian-ecommerce" 

def extract_bronze():
    api = KaggleApi()
    api.authenticate()
    
    temp_dir = Path("./temp_data")
    temp_dir.mkdir(exist_ok=True)
    
    print("Baixando dataset do Olist...")
    api.dataset_download_files(dataset, path=temp_dir, unzip=True)
    
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    
    print("Enviando CSVs para o Storage...")
    for csv_file in temp_dir.glob("*.csv"):
        print(f"Subindo {csv_file.name}...")
        blob = bucket.blob(f"data/bronze/{csv_file.name}")
        blob.upload_from_filename(str(csv_file))
        
    print("Sucesso! Os CSV foram enviados para o bucket.")

if __name__ == "__main__":
    extract_bronze()
