# Final Project
## **Domain of Interest Questions:**
_Why are you interested in this field/domain?_

We are interested in this field/domain because there are many aspects of COVID-19 that are important to track. Data on deaths and hospitalizations can indicate   the severity of the disease, while data on testing and confirmed cases can help track the spread of COVID-19. The disease has taken over the world, and in the United States we have seen the harsh impacts of the disease.

_What other examples of data driven project have you found related to this domain (share at least 3)?_
1. [COVID Worldwide Data Set](https://www.kaggle.com/sudalairajkumar/novel-corona-virus-2019-dataset): This data set has daily information on the new and cumulative cases and deaths, up until the date January 22, 2020. The purpose of this project is to see if data can be used to track the spread of COVID within countries.
2. [Recovered COVID Cases](https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases): The purpose of this data set it to record the number of people who have recovered from COVID, in order to track the severity of the disease.
3. [Race and Ethnicities Affected by COVID](https://data.world/liz-friedman/covid-racial-data-tracker-from-the-covid-tracking-project): The purpose of this data set is to track the number of people within different races/ethnicities that developed COVID. Minorities are statistically shown to have less access to medical resources, so it is important to record if minorities are being disproportionately affected. 

_What data-driven questions do you hope to answer about this domain?_
1. **What is the proportion of people who tested positive for COVID-19 and are hospitalized?** This question can be answered by extracting data for those who are hospitalized and those who tested positive for COVID, and then dividing the two populations.
2. **Do states have the capacity for COVID patients that need to be hospitalized?** This question can be answered by comparing data of the number of patients that are positive for COVID and need hospital care, to the number of hospital beds or equipment that is available.
3. **What is the average survival rate of COVID per state?** This question can be answered by comparing the data of COVID recovered cases to COVID death rates. Hospital capacity and equipment availability may also play a role in this statistic.

## **Finding Data Questions:**

**Dataset 1 (Testing):**

_Where did you download the data (e.g., a web URL)?_

The link to the data I found is [here](https://covidtracking.com/data/download).

_How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?_

The data was collected by comparing and averaging data sets released by the federal government. There were multiple teams within the company that were working with this COVID-19 data (ex. Race and ethnicity team), and each team would collect the data from the federal government that was appropriate to their specific area of data collection. The data is about the United States, and summarizes testing information (antibodies, positive and negative tests, etc), along with additional data such as the number of people in ventilator and the number of cases. 

_How many observations (rows) are in your data?_

20781 observations

_How many features (columns) are in the data?_

41 columns

_What questions (from above) can be answered using the data in this dataset?_
- What is the proportion of people who tested positive for antibodies over those who tested negative?
- What is the number of overall positive test results in a specific state?
- What is the number of overall negative test results in a specific state?

**Dataset 2 (Vaccines):**

_Where did you download the data (e.g., a web URL)?_

I downloaded the data from this link, on [Kaggle](https://www.kaggle.com/paultimothymooney/usa-covid19-vaccinations).

_How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?_

This data set is collected by â€œOur World in Dataâ€?, and they collected data about the current U.S residents and the vaccines distributed.

_How many observations (rows) are in your data?_

As of May 9th, there are 7693 observations.

_How many features (columns) are in the data?_

As of May 9th, there are 14 features.

_What questions (from above) can be answered using the data in this dataset?_
- What is the ratio of vaccinations distributed per hundred vs daily vaccinations?
- What is the ratio of people vaccinated vs the people fully vaccinated (both doses)?

**Dataset 3 (Hospital Capacity):**

_Where did you download the data (e.g., a web URL)?_

The data was downloaded from [data.gov]
(https://catalog.data.gov/dataset/covid-19-reported-patient-impact-and-hospital-capacity-by-state-b528c).

_How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?_

The dataset provides state-aggregated data for hospital utilization. These are derived from reports with facility-level granularity across two main sources: (1) HHS TeleTracking, and (2) reporting provided directly to HHS Protect by state/territorial health departments on behalf of their healthcare facilities.
Publisher: U.S. Department of Health & Human Services

_How many observations (rows) are in your data?_

There are 53 observations in the data set.

_How many features (columns) are in the data?_

There are 97 features in the data set.

_What questions (from above) can be answered using the data in this data set?_
- What is the critical staffing shortage of a certain state from the last 4 days?
- Which state has the highest number of critical staffing shortages from the last 4 days?

**Dataset 4 (Death Counts):**

_Where did you download the data (e.g., a web URL)?_

The data was downloaded from the [webpage](https://data.cdc.gov/NCHS/Provisional-COVID-19-Death-Counts-by-Week-Ending-D/r8kw-7aab) of the Center for Disease Control and Prevention.

_How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?_

The data was collected by the National Center for Health Statistics. The provisional counts for coronavirus disease 2019 (COVID-19) deaths are based on a current flow of mortality data in the National Vital Statistics System.

_How many observations (rows) are in your data?_

As of May 7th, 2021, there are 4860 observations in the data.

_How many features (columns) are in the data?_

As of May 7th, 2021, there are 17 columns in the data.

_What questions (from above) can be answered using the data in this dataset?_
- What is the overall insight of death counts for COVID-19 in U.S.?
- What comparisons can be made using the provisional data between states in terms of dead counts?
- What conclusions and analysis can be driven statewide and nationwide?
