import requests
from bs4 import BeautifulSoup
import pandas as pd

url="https://www.archives.gov/federal-register/electoral-college/2008/popular-vote.html"
r = requests.get(url)

# Turn the HTML into a Beautiful Soup object
soup = BeautifulSoup(r.text, 'lxml')
state=[]
democrat=[]
republican=[]
total_votes=[]
table = soup.find("table",class_=False, id=False)
# Find all the <tr> tag pairs, skip the first one, then for each.
print(table)
for row in table.find_all('tr')[2:]:
    # Create a variable of all the <td> tag pairs in each <tr> tag pair,
    col = row.find_all('td')
    col1=row.find_all('th')
    print("hi")
    print(col[0])
    #hi=col1[0].string.strip()
    print("yolo")
   # print(hi)
    # Create a variable of the string inside 1st <td> tag pair,
    column_1 = col1[0].string
    # and append it to first_name variable
    state.append(column_1)

    # Create a variable of the string inside 2nd <td> tag pair,
    column_2 = col[0].string.strip()
    # and append it to last_name variable
    democrat.append(column_2)

    # Create a variable of the string inside 3rd <td> tag pair,
    column_3 = col[1].string.strip()
    # and append it to age variable
    republican.append(column_3)

    # Create a variable of the string inside 4th <td> tag pair,
    column_4 = col[8].string
    # and append it to preTestScore variable
    total_votes.append(column_4)


# Create a variable of the value of the columns
columns = {'state':state, 'democrat': democrat, 'republican': republican, 'total_votes': total_votes,'year':2008}

# Create a dataframe from the columns variable
df = pd.DataFrame(columns)
print("imma ")
print(df)
df.to_csv("2008election.csv")
