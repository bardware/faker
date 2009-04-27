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
		
		<cfset var sReturn = '' />
		
		<!--- get the firstname, then the surname --->
		<cfset sReturn = this.aFirstnames[randRange(1, ArrayLen(this.aFirstnames))] />
		<cfset sReturn &= ' ' & this.aSurnames[randRange(1, ArrayLen(this.aSurnames))] />
		
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

	<cffunction name="getQuery" return="Query">
		<cfargument name="multiple" type="numeric" default="2" />
		<cfargument name="lColumns" type="string" default="firstname,surname" />
		
		<cfset var qReturn = QueryNew(#arguments.lColumns#) />
		<cfset var sFirstname = '' />
		<cfset var sSurname = '' />
		
		<cfloop from="1" to="#arguments.multiple#" index="i">
		
			<!--- get the firstname --->
			<cfset sFirstname = getFirstname() />
			<cfset sSurname = getSurname() />
			
			<cfset QueryAddRow(qReturn) />
			<cfset QuerySetCell(qReturn, 'firstname', sFirstname) />
			<cfset QuerySetCell(qReturn, 'surname', sSurname) />
				
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
		
		<cfif NOT ListContains('AU,US,UK', arguments.locale)>
			<cfthrow detail="Invalid locale found. You can only use AU, US or UK." errorCode="invalidLocale" type="faker" />
		</cfif>
		
		<cfset sReturn = this['aStates_' & arguments.locale][randRange(1, ArrayLen(this['aStates_' & arguments.locale]))] />
		
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