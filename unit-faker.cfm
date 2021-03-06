<cfsetting enablecfoutputonly="true" />

<cfset oFaker = CreateObject("component", "faker") />

<cfparam name="url.method" default="" />
<cfparam name="bShowResult" default="true" />
<cfparam name="result" default="" />

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>scottmebberson.com | faker | Unit Test</title>
	
	<style type="text/css" media="screen">

		body {
			font-family: Helvetica, Arial, sans-serif;
			color: ##333;
		}

		h1, p {
			margin: 10px 0;
		}
		
		h2 {
			color: ##0092B2;
			margin-bottom: 4px;
		}
		
		p.branding, p.branding a, p.branding a:hover {
			color: ##B5CF00;
			font-size: 14px;
			font-weight: bold;
		}

		p.copyright {

			color: ##CCC;
			font-size: 10px;

		}

		div.result {
		
			position: absolute;
			top: 100px;
			right: 0px;
			width: 300px;
		
		}

	</style>
	
</head>

<body>
	
	<p class="branding"><a href="http://scottmebberson.com/">scottmebberson.com</a></p>
	
	<h1>faker Unit Test</h1>
	
	<p>faker is a data generator for ColdFusion (taking insipration from ruby faker).</p>
	<p>This is unit tester for faker.</p>
	
	<h2>Names</h2>
	<ul>
		<li><a href="?method=getName">getName</a></li>
		<li><a href="?method=getNames">getNames</a></li>
		<li><a href="?method=getFirstname">getFirstname</a></li>
		<li><a href="?method=getFirstnames">getFirstnames</a></li>
		<li><a href="?method=getSurname">getSurname</a></li>
		<li><a href="?method=getSurnames">getSurnames</a></li>
	</ul>
	
	<h2>Address</h2>
	<ul>
		<li><a href="?method=getStreetName">getStreetName</a></li>
		<li><a href="?method=getStreetAddress">getStreetAddress</a></li>
		<li><a href="?method=getCity">getCity</a></li>
		<li><a href="?method=getState">getState</a></li>
		<li><a href="?method=getStateAbbr">getStateAbbr</a></li>
	</ul>
	
	<h2>General</h2>
	<ul>
		<li><a href="?method=getQuery">getQuery</a></li>
		<li><a href="?method=numerify">numerify</a></li>
		<li><a href="?method=letterify">letterify</a></li>
		<li><a href="?method=bothify">bothify</a></li>
	</ul>
	
	<h2>Helper Methods</h2>
	<ul><li><a href="?method=getStreetSuffix">getStreetSuffix</a></li>
		<li><a href="?method=getCityPrefix">getCityPrefix</a></li>
		<li><a href="?method=getCitySuffix">getCitySuffix</a></li>
		<li><a href="?method=getNamePrefix">getNamePrefix</a></li>
		<li><a href="?method=getNameSuffix">getNameSuffix</a></li>
	</ul>
	
	</cfoutput>
	
	<cfswitch expression="#url.method#">
	
		<cfcase value="getName">			
			<cfset result = oFaker.getName() />				
		</cfcase>
		
		<cfcase value="getNamePrefix">			
			<cfset result = oFaker.getNamePrefix() />				
		</cfcase>
		
		<cfcase value="getNameSuffix">			
			<cfset result = oFaker.getNameSuffix() />				
		</cfcase>
		
		<cfcase value="getNames">			
			<cfset result = oFaker.getNames(100) />				
		</cfcase>
		
		<cfcase value="getFirstname">			
			<cfset result = oFaker.getFirstname() />				
		</cfcase>
		
		<cfcase value="getFirstnames">			
			<cfset result = oFaker.getFirstnames(100) />				
		</cfcase>
		
		<cfcase value="getSurname">			
			<cfset result = oFaker.getSurname() />
		</cfcase>
		
		<cfcase value="getSurnames">
			<cfset result = oFaker.getSurnames(100) />
		</cfcase>
		
		<cfcase value="getStreetSuffix">
			<cfset result = oFaker.getStreetSuffix() />
		</cfcase>
		
		<cfcase value="getStreetName">
			<cfset result = oFaker.getStreetName() />
		</cfcase>
		
		<cfcase value="getStreetAddress">
			<cfset result = oFaker.getStreetAddress() />
		</cfcase>
		
		<cfcase value="getCityPrefix">
			<cfset result = oFaker.getCityPrefix() />
		</cfcase>
		
		<cfcase value="getCitySuffix">
			<cfset result = oFaker.getCitySuffix() />
		</cfcase>
		
		<cfcase value="getCity">
			<cfset result = oFaker.getCity() />
		</cfcase>
		
		<cfcase value="getState">
			<cfset result = oFaker.getState() />
		</cfcase>
		
		<cfcase value="getStateAbbr">
			<cfset result = oFaker.getStateAbbr() />
		</cfcase>
		
		<cfcase value="getQuery">
			<cfset aColumns = [
					{function = 'getFirstname', column = 'firstname'},
					{function = 'getSurname', column = 'surname'},
					{function = 'getStreetAddress', column = 'streetaddress'},
					{function = 'getCity', column = 'city', args = {locale = 'UK'}},
					{function = 'getState', column = 'state', args = {locale = 'UK'}}
					] />
			<cfset result = oFaker.getQuery(multiple = 100, columns = aColumns) />
		</cfcase>
		
		<cfcase value="numerify">
			<cfset result = oFaker.numerify() />
		</cfcase>
		
		<cfcase value="letterify">
			<cfset result = oFaker.letterify() />
		</cfcase>
		
		<cfcase value="bothify">
			<cfset result = oFaker.bothify() />
		</cfcase>
		
		<cfdefaultcase>
			<cfset bShowResult = false />
		</cfdefaultcase>
	
	</cfswitch>
	
	<cfif bShowResult>
		
		<cfoutput>
		<div class="result">
			
			<h3>#url.method# was executed</h3>
			<p>Result:</p>
		</cfoutput>
		
		<cfdump var="#result#" />
		
		<cfoutput>
		</div>
		</cfoutput>
		
	</cfif>
	
	<cfoutput>
	
	<p class="copyright">&copy; 2009 scottmebberson.com</p>
	
	<!--- script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
	try {
	var pageTracker = _gat._getTracker("UA-103127-6");
	pageTracker._trackPageview();
	} catch(err) {}</script --->
	
</body>
</html>
</cfoutput>