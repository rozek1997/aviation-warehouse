<h1>Airport Data Warehouse project</h1>
<h2>Tools used</h2>
  <ul>
    <li>SAP Power Designer - to model the stage and main repository area</li>
    <li>MS SQL Server 2017</li>
    <li>Visual Studio 2017 with the addition of SQL Server Integration Services (SSIS) - to administer the ETL process and perform component procedures</li>
    <li>Visual Studio 2017 with SQL Server Analysis Services (SSAS)</li>
    <li>Miscrosoft Power BI - for business analysis</li>
  </ul>
<h2>Brief description</h2>
  <p> The project consisted in designing a data warehouse for flights in the USA in 2019.<br>The source of the facts: 
  <ul>
    <li><a href="https://transtats.bts.gov/DL_SelectFields.asp?Table_ID=236">Source of data for fact table(Fact Flight)</a></li>
    <li><a href="https://openflights.org/data.html">Source for dimension tables</a></li>
  </ul>
  The project consisted of several stages. The individual stages consisted of:
    <ol>
      <li>Proceed with loading data from .csv files to the stage</li> area
      <li>Please conduct the ETL process. This process was performed using component procedures that cleaned and then loaded data into the dimension tables of the main repository</li>
      <li>The next step was to load the data into the facts table, where a single flight was taken as a fact. In the fact table, the dimensional data was replaced by the data from lookup</li> tables. 
      <li> For the main repository area, you had to create an OLAP cube using the Visual Studio tool with SQL Server Analysis Services (SSAS)</li>.
      <li>The last step was to execute reports in Microsoft Power BI using the executed OLAP</li> cube.
    </ol>

  </p>

<h2>Models of the stage area and the main reportment area</h2>
<h3>Model stage</h3>

![Stage model](Screeny/model_STAGE.PNG)

<h3>Model main repo</h3>

![Stage model](Screeny/model_HD.PNG)

<h2>Additional information</h2>
  <p>In the Scripts folder there are scripts containing procedures needed for the ETL process to work</p>
  <p>In the Models folder you will find the Models modeled in Power Design-er together with the generated scripts that create specific databases of the data warehouse</p>.
