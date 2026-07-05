from google.cloud import bigquery

PROJECT_ID = "study-workspace-500319"
BUCKET_NAME = "project-ecommerce"
BUCKET_PREFIX = "data/bronze/"
DATASET_ID = "project_ecommerce_silver" 
client = bigquery.Client(project=PROJECT_ID)
FILE_TABLE_MAP = {
    "olist_customers_dataset.csv": "tb_customers",
    "olist_geolocation_dataset.csv": "tb_geolocation",
    "olist_order_items_dataset.csv": "tb_order_itens",
    "olist_order_payments_dataset.csv": "tb_order_payments",
    "olist_orders_dataset.csv": "tb_orders",
    "olist_products_dataset.csv": "tb_products",
    "olist_sellers_dataset.csv": "tb_sellers",
    "product_category_name_translation.csv": "tb_product_category"}


def ensure_dataset_exists():
    dataset_ref = bigquery.Dataset(f"{PROJECT_ID}.{DATASET_ID}")
    try:
        client.get_dataset(dataset_ref)
        print(f"Dataset {PROJECT_ID}.{DATASET_ID} já existe.")
    except Exception:
        client.create_dataset(dataset_ref)
        print(f"Dataset {PROJECT_ID}.{DATASET_ID} criado com sucesso.")

def load_csv_to_bq(file_name: str, table_name: str):
    uri = f"gs://{BUCKET_NAME}/{BUCKET_PREFIX}{file_name}"
    table_id = f"{PROJECT_ID}.{DATASET_ID}.{table_name}"

    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True,
        write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
        field_delimiter=",",
        allow_quoted_newlines=True,
    )

    print(f"\nCarregando: {uri}")
    print(f"Destino: {table_id}")

    job = client.load_table_from_uri(
        uri,
        table_id,
        job_config=job_config
    )

    job.result()

    table = client.get_table(table_id)
    print(f"OK -> {table_id} | linhas carregadas: {table.num_rows}")


def main():
    ensure_dataset_exists()

    for file_name, table_name in FILE_TABLE_MAP.items():
        try:
            load_csv_to_bq(file_name, table_name)
        except Exception as e:
            print(f"ERRO ao carregar {file_name} -> {table_name}: {e}")

if __name__ == "__main__":
    main()
