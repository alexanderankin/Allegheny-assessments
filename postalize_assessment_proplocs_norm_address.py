"""
This script assumes that there is a table of property locations like 

for the moment, though, hijacking this to work on afve_ppl_ind

"""
import json
import pymysql
from postal.parser import parse_address

def main():
    database_info = {
        'host':'localhost',
        'port':3306,
        'user':'root',
        'passwd':'toor',
        'db':'lmda'}

    conn = pymysql.connect(**database_info)
    cur = conn.cursor()
    print("Connected with " + str(database_info))

    cur.execute("SELECT count(*) as num_rows FROM afve_ppl_ind")
    num_rows = next(iter(cur))[0]
    print("found {} rows".format(num_rows))

    for i in range(num_rows):
        # id in sql table are 1 indexed
        this_id = i + 1

        cur.execute("SELECT id, IDNumber, First, last, HouseNumber, HouseNumberSuffix, " + \
                    "Street, ApartmentNumber, Address2, City, State, Zip from afve_ppl_ind where id =  %s ;", (this_id,))
        # get the row
        row = next(iter(cur), None)
        # skip first four things
        address_fields = (list(row))[4:]
        # remove absent things
        address_fields = [af for af in address_fields if af]
        # make sure its a string
        #print(type(' '.join(address_fields)))

        # parse address and print
        parsed_address = parse_address(' '.join(address_fields))
        parsed_address_dict = { k:v for v,k in parsed_address }
        print(json.dumps(parsed_address_dict))

        # debugging
        break;

    cur.close()
    conn.close()

if __name__ == '__main__':
    main()
