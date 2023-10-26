import oracledb
import config as cfg

def create_oracle_connection():
    """
    Create connection with the Oracle database

    :return: the Oracle database connection
    """
    try:
        connection = oracledb.connect(user=cfg.username,
                                      password=cfg.password,
                                      dsn=cfg.dsn,
                                      config_dir=cfg.config_dir,
                                      wallet_location=cfg.wallet_location,
                                      wallet_password=cfg.wallet_password)
        return connection
    except oracledb.DatabaseError as error:
        raise Exception(f"Error when creating connection with the Oracle database: {error}")

def delete_records_db():
    """
    Delete all test records

    """
    dbconnection = create_oracle_connection()
    try:
        if dbconnection:
            # create a cursor
            with dbconnection.cursor() as cursor:
                # call stored procedure
                cursor.callproc('ocw_demo.delete_test_data')
    
    except oracledb.DatabaseError as error:
        raise Exception(f"An error occurred when deleting the data: {error}")
    finally:
        if dbconnection:
            dbconnection.close()

def insert_test_data():
    """
    Insert default test data

    """
    dbconnection = create_oracle_connection()
    try:
        if dbconnection:
            # create a cursor
            with dbconnection.cursor() as cursor:
                # call stored procedure
                cursor.callproc('ocw_demo.insert_test_data')
    
    except oracledb.DatabaseError as error:
        raise Exception(f"An error occurred when inserting data: {error}")
    finally:
        if dbconnection:
            dbconnection.close()