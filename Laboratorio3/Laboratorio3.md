```python
import sys
!{sys.executable} -m pip install numpy
!{sys.executable} -m pip install pandas
!{sys.executable} -m pip install pandasql
import numpy as np
import pandas as pd
from pandasql import *
heroes = pd.read_csv("heroes_information.csv")

pysqldf = lambda q: sqldf(q,globals())

```

    Requirement already satisfied: numpy in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (1.19.1)

    WARNING: You are using pip version 20.1.1; however, version 20.2.2 is available.
    You should consider upgrading via the 'c:\users\juan_\appdata\local\programs\python\python38\python.exe -m pip install --upgrade pip' command.
    

    
    Requirement already satisfied: pandas in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (1.1.0)
    Requirement already satisfied: pytz>=2017.2 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandas) (2020.1)
    Requirement already satisfied: python-dateutil>=2.7.3 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandas) (2.8.1)
    Requirement already satisfied: numpy>=1.15.4 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandas) (1.19.1)
    Requirement already satisfied: six>=1.5 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from python-dateutil>=2.7.3->pandas) (1.15.0)
    

    WARNING: You are using pip version 20.1.1; however, version 20.2.2 is available.
    You should consider upgrading via the 'c:\users\juan_\appdata\local\programs\python\python38\python.exe -m pip install --upgrade pip' command.
    WARNING: You are using pip version 20.1.1; however, version 20.2.2 is available.
    You should consider upgrading via the 'c:\users\juan_\appdata\local\programs\python\python38\python.exe -m pip install --upgrade pip' command.
    

    Collecting pandasql
      Downloading pandasql-0.7.3.tar.gz (26 kB)
    Requirement already satisfied: numpy in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandasql) (1.19.1)
    Requirement already satisfied: pandas in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandasql) (1.1.0)
    Collecting sqlalchemy
      Downloading SQLAlchemy-1.3.18-cp38-cp38-win_amd64.whl (1.2 MB)
    Requirement already satisfied: pytz>=2017.2 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandas->pandasql) (2020.1)
    Requirement already satisfied: python-dateutil>=2.7.3 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from pandas->pandasql) (2.8.1)
    Requirement already satisfied: six>=1.5 in c:\users\juan_\appdata\local\programs\python\python38\lib\site-packages (from python-dateutil>=2.7.3->pandas->pandasql) (1.15.0)
    Using legacy setup.py install for pandasql, since package 'wheel' is not installed.
    Installing collected packages: sqlalchemy, pandasql
        Running setup.py install for pandasql: started
        Running setup.py install for pandasql: finished with status 'done'
    Successfully installed pandasql-0.7.3 sqlalchemy-1.3.18
    


```python
# 1. what is the first name in heroes table?
```


```python
q1 = " SELECT * FROM heroes LIMIT 1"
pysqldf(q1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>id</th>
      <th>name</th>
      <th>Gender</th>
      <th>Eye color</th>
      <th>Race</th>
      <th>Hair color</th>
      <th>Height</th>
      <th>Publisher</th>
      <th>Skin color</th>
      <th>Alignment</th>
      <th>Weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>A-Bomb</td>
      <td>Male</td>
      <td>yellow</td>
      <td>Human</td>
      <td>No Hair</td>
      <td>203.0</td>
      <td>Marvel Comics</td>
      <td>None</td>
      <td>good</td>
      <td>441.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 2. How many publisher exists?
```


```python
q2 = "SELECT COUNT(DISTINCT Publisher) FROM heroes"
pysqldf(q2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(DISTINCT Publisher)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>24</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 3. How many superheroes are taller than 2 meters (200 cms)?
```


```python
q3 = "SELECT COUNT(*) FROM heroes WHERE Height > 200"
pysqldf(q3)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>59</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 4. How many superheroes are human and are taller than 2 meters (200 cms)?
```


```python
q4 = "SELECT COUNT(*) FROM heroes WHERE Height > 200 AND race = 'Human'"
pysqldf(q4)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>12</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 5. How many superheroes weigh more than 100 lbs and less than 200 lbs?
```


```python
q5 = "SELECT COUNT(*) FROM heroes WHERE Weight BETWEEN 100 AND 200"
pysqldf(q5)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>98</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 6.How many superheroes have blue or red eyes?
```


```python
q6 = "SELECT COUNT(*) FROM heroes WHERE `Eye color` in ('red', 'blue')"
pysqldf(q6)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>271</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 7. How many superheroes are Human, Mutant and have Green hair or are Vampires with black hair?
```


```python
q7 = "SELECT COUNT(*) FROM heroes WHERE (Race in ('Human', 'Mutant') AND `Hair color` = 'Green') OR (Race = 'Vampire' AND `Hair color` = 'Black')"
pysqldf(q7)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 8. What is the name of the first superhero if I sort the table by race in order falling?
```


```python
q8 = "SELECT Name FROM heroes ORDER BY Race DESC LIMIT 1"
pysqldf(q8)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Solomon Grundy</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 9. How many superheroes are male and how many female?
```


```python
q9 = "SELECT Gender, count(*) FROM heroes GROUP BY Gender"
pysqldf(q9)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Gender</th>
      <th>count(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>None</td>
      <td>29</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Female</td>
      <td>200</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Male</td>
      <td>505</td>
    </tr>
  </tbody>
</table>
</div>




```python
# 10. How many publishing houses have more than 15 superheroes?
```


```python
q10 = "SELECT Publisher, count(name) FROM heroes GROUP BY Publisher HAVING COUNT(Publisher) > 15"
pysqldf(q10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Publisher</th>
      <th>count(name)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>DC Comics</td>
      <td>215</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Dark Horse Comics</td>
      <td>18</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Marvel Comics</td>
      <td>388</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NBC - Heroes</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
</div>


