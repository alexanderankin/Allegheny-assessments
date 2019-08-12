# Taxes

This folder contains scripts to use for working with the tax assessments records in Allegheny County.

the update-join query takes about 2 minutes to run, and the whole script takes maybe 4 or 5.

the imports are taken from [this][1] site, and the csv filename is derived by changing the url string as follows:

```
$ echo "$(echo -n "data.wprdc.org/dataset/property-assessments/resource/518b583f-7cc8-4f60-94d0-174cc98310dc" | tr '/.' '_-').csv"
data-wprdc-org_dataset_property-assessments_resource_518b583f-7cc8-4f60-94d0-174cc98310dc.csv
```

## mapping to voter id

create virtual python environment and use libpostal to hash addresses in voter file. In summary:


```
virtualenv env --python=python3
source env/bin/activate
pip install -r requirements.txt
```

[1]: https://data.wprdc.org/dataset/property-assessments/resource/518b583f-7cc8-4f60-94d0-174cc98310dc "Allegheny County Property Assessments"

```
pip freeze > installed.txt
rm -rf env
```
