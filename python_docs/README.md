# Python Client Documentation
The code in this directory builds Python client documentation with Sphinx. You need to install
these packages in order to build the docs.

```
$ pip install sphinx sphinxcontrib-openapi sphinx-copybutton furo
```

You also need `swagger-codegen-cli` available in the system path.

Run this command to build the docs while in this directory.
```
$ make html
```
