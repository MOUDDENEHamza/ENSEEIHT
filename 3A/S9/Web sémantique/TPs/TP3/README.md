1. In which country does the Nile start?

PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?source ?paysLabel WHERE {
    {
        dbr:Nile dbp:source2Location ?source.
        ?source dbo:country ?pays.
        OPTIONAL { 
        	?pays rdfs:label ?paysLabel.
        	FILTER (lang(?paysLabel) = 'en').
    	}
    }
    UNION 
    {
        dbr:Nile dbp:source ?source.
        ?source dbp:source1Location ?paysLabel.
        FILTER(lang(?paysLabel) = 'en' && strlen( ?paysLabel ) > 0).
    }
}

2. How tall is Claudia Schiffer?

PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?height ?unitLabel WHERE {
    dbr:Claudia_Schiffer <http://dbpedia.org/ontology/Person/height> ?height.
    <http://dbpedia.org/ontology/Person/height> rdfs:label ?unitLabel.
    FILTER(Lang(?unitLabel)="en").
}

3. Which are the capitals of all countries in Africa?

PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?country ?capitalLabel WHERE { 
    ?country dct:subject dbc:Countries_in_Africa.
    ?country dbo:capital ?capital.
    OPTIONAL { 
        ?capital rdfs:label ?capitalLabel.
        FILTER(lang(?capitalLabel) = 'en').
   }
}

4. Which french cities have more than 100000 inhabitants?

PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX res: <http://dbpedia.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?locationlabel ?population WHERE {
    {
        ?FrenchLocation dbo:country dbr:France .
        ?FrenchLocation dbp:urbanPop ?population .
        FILTER (?population >= 100000) .
        OPTIONAL { 
            ?FrenchLocation rdfs:label ?locationlabel.
            FILTER (lang(?locationlabel) = 'fr') 
        }
    }
    UNION
    {
        ?FrenchLocation dct:subject dbc:Cities_in_France .
        ?FrenchLocation dbo:populationTotal ?population .
        FILTER (?population >= 100000) .
        OPTIONAL {
            ?FrenchLocation rdfs:label ?locationlabel.
            FILTER (lang(?locationlabel) = 'fr')
        }
    }
}

5. Which states border Illinois?

PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbp: <http://dbpedia.org/property/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?borderingStates, ?borderingStatesLabel WHERE {
    dbr:Illinois  dbp:borderingstates ?borderingStates.
    ?borderingStates rdfs:label ?borderingStatesLabel.
    FILTER(lang(?borderingStatesLabel)="en").
}

6. Which television shows were created by Walt Disney?

PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT DISTINCT ?TvShow, ?TvShowLabel WHERE {
   dbr:Disney_Channel dbo:wikiPageWikiLink ?TvShow.
   ?TvShow rdf:type dbo:TelevisionShow.
   ?TvShow rdfs:label ?TvShowLabel.
   FILTER(lang(?TvShowLabel)="en").
}

7. In which films directed by Garry Marshall was Julia Roberts starring?

PREFIX dbr: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?film, ?filmLabel WHERE {
    ?film dbo:starring dbr:Julia_Roberts.
    ?film dbo:director dbr:Garry_Marshall.
    ?film rdfs:label ?filmLabel.
   FILTER(lang(?filmLabel)="en").
}

8. Which awards did WikiLeaks win?

PREFIX dbr:<http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?award ?name WHERE {
          dbr:Reception_of_WikiLeaks dbo:wikiPageWikiLink ?award.
          ?award rdf:type  dbo:Award.
          ?award rdfs:label ?name.
          FILTER (lang(?name) = "en"). 
}

9. What is the currency of the Czech Republic?

PREFIX dbr:<http://dbpedia.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?currency, ?currencyLabel WHERE {
    dbr:Czech_Republic dbo:currency ?currency.
    OPTIONAL { 
        ?currency rdfs:label ?currencyLabel.
        FILTER(lang(?currencyLabel) = 'en').
    }
}

10. What is the area code of Berlin?

PREFIX dbr:<http://dbpedia.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?area, ?areaCode WHERE {
    OPTIONAL { 
                dbr:Berlin rdfs:label  ?area.
                FILTER (lang(?area) = 'en').
    }
    dbr:Berlin dbo:areaCode  ?areaCode.
}
