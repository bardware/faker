<cfcomponent name="faker" displayname="Faker">

	<cffunction name="getFirstname" return="String">
		
		<cfset var sReturn = '' />
		
		<!--- get the firstname --->
		<cfset sReturn = this.aFirstnames[randRange(1, ArrayLen(this.aFirstnames))] />
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="getFirstnames" return="Array">
		<cfargument name="multiple" type="numeric" default="1" />
		
		<cfset var aReturn = ArrayNew(1) />
		<cfset var sName = '' />
		
		<cfloop from="1" to="#arguments.multiple#" index="i">
		
			<!--- get the firstname --->
			<cfset sName = this.aFirstnames[randRange(1, ArrayLen(this.aFirstnames))] />
			<cfset ArrayAppend(aReturn, sName) />
		
		</cfloop>
		
		<cfreturn aReturn />
		
	</cffunction>
	
	<cffunction name="getSurname" return="String">
		
		<cfset var sReturn = '' />
		
		<!--- get the firstname --->
		<cfset sReturn = this.aSurnames[randRange(1, ArrayLen(this.aSurnames))] />
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="getSurnames" return="Array">
		<cfargument name="multiple" type="numeric" default="2" />
		
		<cfset var aReturn = ArrayNew(1) />
		<cfset var sName = '' />
		
		<cfloop from="1" to="#arguments.multiple#" index="i">
		
			<!--- get the firstname --->
			<cfset sName = this.aSurnames[randRange(1, ArrayLen(this.aSurnames))] />
			<cfset ArrayAppend(aReturn, sName) />
		
		</cfloop>
		
		<cfreturn aReturn />
		
	</cffunction>

	<cffunction name="getName" return="String">
		<cfargument name="bPrefix" type="boolean" default="false" />
		<cfargument name="bSuffix" type="boolean" default="false" />
		
		<cfset var sReturn = '' />
		
		<!--- get the firstname, then the surname --->
		<cfset sReturn = this.aFirstnames[randRange(1, ArrayLen(this.aFirstnames))] />
		<cfset sReturn &= ' ' & this.aSurnames[randRange(1, ArrayLen(this.aSurnames))] />
		
		<!--- do we need the suffix? --->
		<cfif arguments.bPrefix><cfset sReturn = getNamePrefix() & ' ' & sReturn /></cfif>
		<cfif arguments.bSuffix><cfset sReturn = sReturn & ' ' & getNameSuffix() /></cfif>
		
		<cfreturn sReturn />
		
	</cffunction>

	<cffunction name="getNames" return="Array">
		<cfargument name="multiple" type="numeric" default="2" />
		
		<cfset var aReturn = ArrayNew(1) />
		<cfset var sName = '' />
		
		<cfloop from="1" to="#arguments.multiple#" index="i">
		
			<!--- get the firstname --->
			<cfset sName = this.aFirstnames[randRange(1, ArrayLen(this.aFirstnames))] />
			<cfset sName &= ' ' & this.aSurnames[randRange(1, ArrayLen(this.aSurnames))] />
			
			<cfset ArrayAppend(aReturn, sName) />
				
		</cfloop>
		
		<cfreturn aReturn />
		
	</cffunction>
	
	<cffunction name="getNamePrefix" return="String">
		
		<cfset var sReturn = '' />
		
		<cfset sReturn = this.aNamesPrefix[randRange(1,ArrayLen(this.aNamesPrefix))] />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getNameSuffix" return="String">
		
		<cfset var sReturn = '' />
		
		<cfset sReturn = this.aNamesSuffix[randRange(1,ArrayLen(this.aNamesSuffix))] />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getStreetSuffix" return="String">
		
		<cfset var sReturn = '' />
		
		<cfset sReturn = this.aStreetSuffix[randRange(1,ArrayLen(this.aStreetSuffix))] />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getStreetName" return="String">
		
		<cfset var sReturn = '' />
		<cfset var nIndex= randRange(1, 2) />
		
		<cfswitch expression="#nIndex#">
			
			<cfcase value="2">
				<cfset sReturn = getFirstname() & ' ' & getStreetSuffix() />
			</cfcase>
			
			<cfdefaultcase>
				<cfset sReturn = getSurname() & ' ' & getStreetSuffix() />
			</cfdefaultcase>
			
		</cfswitch>
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getStreetAddress" return="String">
		
		<cfset var sReturn = '' />
		<cfset var nIndex= randRange(1, 4) />
		
		<cfset sReturn = numerify(repeatString('##', nIndex)) & ' ' & getStreetName() />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getCityPrefix" return="String">
		
		<cfset var sReturn = '' />
		
		<cfset sReturn = this.aCitiesPrefix[randRange(1,ArrayLen(this.aCitiesPrefix))] />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getCitySuffix" return="String">
		
		<cfset var sReturn = '' />
		
		<cfset sReturn = this.aCitiesSuffix[randRange(1,ArrayLen(this.aCitiesSuffix))] />
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getCity" return="String">
		
		<cfset var sReturn = '' />
		<cfset var nIndex= randRange(1, 4) />
		
		<cfswitch expression="#nIndex#">
			
			<cfcase value="2">
				<cfset sReturn = getCityPrefix() & ' ' & getFirstname() & getCitySuffix() />
			</cfcase>
			
			<cfcase value="3">
				<cfset sReturn = getCityPrefix() & ' ' & getFirstname() />
			</cfcase>
			
			<cfcase value="4">
				<cfset sReturn = getFirstname() & getCitySuffix() />
			</cfcase>
			
			<cfdefaultcase>
				<cfset sReturn = getSurname() & getCitySuffix() />
			</cfdefaultcase>
			
		</cfswitch>
		
		<cfreturn sReturn />
	
	</cffunction>
	
	<cffunction name="getQuery" return="Query" output="true">
		<cfargument name="multiple" type="numeric" default="2" />
		<cfargument name="columns" type="Array" required="true" />
		
		<cfset var qReturn = QueryNew('') />
		<cfset var lColumns = '' />
		<cfset var faker = CreateObject('component', 'faker') />
		<cfset var sResult = '' />
		<cfset var stArgs = {} />
		
		<!--- create a new query with the required columns --->
		<cfloop array="#arguments.columns#" index="i">
			<cfset lColumns = ListAppend(lColumns, i.column) />
		</cfloop>
		<cfset qReturn = QueryNew(lColumns) />
		
		<!--- let's create the rows in the queries --->
		<cfloop from="1" to="#arguments.multiple#" index="count">
		
			<cfset QueryAddRow(qReturn) />
		
			<!--- let's set cell for the row on each column, dynamically evaluating the methods to call --->
			<cfloop array="#arguments.columns#" index="i">
				<cfif NOT ListContains('getFirstname,getSurname,getStreetName,getStreetAddress,getCity,getState', i.function)>
					<cfthrow detail="Invalid method. You can only use getFirstname, getSurname, getStreetName, getStreetAddress, getCity, getState." errorCode="invalidMethod" type="faker" />
				</cfif>
				<cfset stArgs = {} />
				<cfif isDefined('i.args')><cfset stArgs = i.args /></cfif>
				<cfset sResult = evaluate('faker.#i.function#(argumentCollection=stArgs)') />
				<cfset QuerySetCell(qReturn, i.column, sResult) />
			</cfloop>
		
		</cfloop>
		
		<cfreturn qReturn />
		
	</cffunction>
	
	<cffunction name="numerify" return="String">
		<cfargument name="format" type="string" default="######## ###### ######" />
		
		<cfset var sReturn = arguments.format />
		
		<cfloop from="1" to="#len(arguments.format)#" index="i">
			<cfset nRandom = randRange(0,9) />
			<cfset sReturn = reReplace(sReturn, '\##', nRandom) />
		</cfloop>
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="letterify" return="String">
		<cfargument name="format" type="string" default="the c?t s?t on the m?t" />
		
		<cfset var sReturn = arguments.format />
		
		<cfloop from="1" to="#len(arguments.format)#" index="i">
			<cfset nRandom = randRange(97,122) />
			<cfset sReturn = reReplace(sReturn, '\?', chr(nRandom)) />
		</cfloop>
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="bothify" return="String">
		<cfargument name="format" type="string" default="##?##?##" />
		
		<cfset var sReturn = letterify(numerify(arguments.format)) />
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="getState" return="String">
		<cfargument name="locale" type="string" default="AU" />
		
		<cfset var sReturn = '' />
		
		<cfif NOT ListContains('AU,US,UK', locale)>
			<cfthrow detail="Invalid locale found. You can only use AU, US or UK." errorCode="invalidLocale" type="faker" />
		</cfif>
		
		<cfset sReturn = this['aStates_' & locale][randRange(1, ArrayLen(this['aStates_' & locale]))] />
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cffunction name="getStateAbbr" return="String">
		<cfargument name="locale" type="string" default="AU" />
		
		<cfset var sReturn = '' />
		
		<cfif NOT ListContains('AU,US', arguments.locale)>
			<cfthrow detail="Invalid locale found. You can only use AU, US." errorCode="invalidLocale" type="faker" />
		</cfif>
		
		<cfset sReturn = this['aStatesAbbr_' & arguments.locale][randRange(1, ArrayLen(this['aStatesAbbr_' & arguments.locale]))] />
		
		<cfreturn sReturn />
		
	</cffunction>
	
	<cfinclude template="faker/fakerlib.cfm" />

</cfcomponent>