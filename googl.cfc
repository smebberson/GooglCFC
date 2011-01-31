<cfcomponent name="Google URL Shortner">
	
	<cfset _apiURL = '' />
	<cfset _apiKey = '' />
	
	<cffunction name="init" output="false" returnType="googl">
		<cfargument name="apiURL" type="string" required="false" default="https://www.googleapis.com/urlshortener/v1/url" />
		<cfargument name="apiKey" type="string" required="false" default="" />
		
		<cfset variables._apiURL = arguments.apiURL />
		<cfset variables._apiKey = arguments.apiKey />
		
		<cfreturn this>
	</cffunction>
	
	<!--- shorten the url, and return the result as json --->
	<cffunction name="shorten" returnType="string">
		<cfargument name="url" type="string" required="true" />
		
		<cfset var sResult = "" />
		<cfset var sContent = '{"longUrl":"#arguments.url#"}' />
		
		<cfhttp url="#getURL()#" method="post" result="sResult">
			<cfhttpparam type="header" name="Content-Type" value="application/json" />
			<cfhttpparam type="body" value="#sContent.toString()#" />
		</cfhttp>
		
		<cfreturn sResult.filecontent.toString()>
		
	</cffunction>
	
	<!--- shorten the url, and return the result as a native ColdFusion struct --->
	<cffunction name="shortenAsStruct" returnType="struct">
		<cfargument name="url" type="string" required="true" />
		
		<cfset var sResult = shorten(url=arguments.url) />
		
		<cfreturn deserializeJson(sResult)>
		
	</cffunction>
	
	<cffunction name="getURL" access="private" returnType="string">
		
		<cfset var sUrl = variables._apiURL />
		
		<cfif len(variables._apiKey)><cfset sUrl = sUrl & '&api=' & variables._apiKey /></cfif>
		
		<cfreturn sUrl>
		
	</cffunction>
	
</cfcomponent>