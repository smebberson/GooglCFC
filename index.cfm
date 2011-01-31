<cfsetting enablecfoutputonly="Yes">

<cfparam name="url.url" default="http://www.google.com/" />
<cfset oGoogl = CreateObject("component", "googl").init() />

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Google URL Shortener CFC</title>
	
	<style>
	
	* {
		font-family: helvetica;
	}
	
	##url {
		width: 250px;
	}
	
	</style>

</head>
<body>

<h1>ColdFusion CFC for the Google URL Shortener API</h1>

<p><a href="http://goo.gl/c4yjS">Read more about goo.gl here.</a></p>

<form method="post">

	<label for="url">
	URL: <input id="url" type="text" name="url" value="#url.url#" />
	</label>

	<p><input type="submit" name="submit" value="Shorten" /></p>

</form>

</cfoutput>

<!--- shortener --->
<cfif isDefined('form.submit')>
	
	<cfset s = oGoogl.shorten(form.url) />
	<cfdump var="#s#" />
	
	<cfset s = oGoogl.shortenAsStruct(form.url) />
	<cfdump var="#s#" />
	
</cfif>

<cfoutput>
	</body>
	</html>
</cfoutput>

<cfsetting enablecfoutputonly="No">