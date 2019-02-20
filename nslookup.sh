#!/bin/bash
for domain in $(cat domains);do
	echo  $domain"," | tr -d '\n' >> nslookupResult;
	nslookup $domain | grep Addr | cut -d$'\t' -f2 | cut -d ' ' -f2 | sed -n -e 'H;${x;s/\n/,/g;s/^,//;p;}' >> nslookupResult
#tr -d '\n'
done

