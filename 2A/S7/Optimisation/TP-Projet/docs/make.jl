using Documenter
using Optinum


makedocs(    
    modules = [Optinum],
    sitename = "Optinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",
	    "Sujet" => "Sujet.md",
            "Algorithmes" => [
            "L'algorithme de Newton local" => "Algorithme_de_newton.md",
            "La méthode des régions de confiance" => "Regions_de_confiance.md",    
            "La méthode du Lagrangien augmenté" => "Lagrangien_augmente.md"                
            ],
	    "Index des fonctions" =>"fct_index.md",
            "Annexes" => "Annexes.md",
            #"Exemples d'appels" =>"Exemples.md",
            "Installation de Julia et tests unitaires" => "mise_en_place.md",
            #"Julia vs MatLab"=> "julia_vs_matlab.md", 
            #"Création de Modules en Julia" => "create_package.md",
            #"Création d'un dépôt Git pour un module Julia" => "git_doc.md",
            #"Géneration de la doc" => "generation_doc.md",
            #"Intégration continue et déploiement de la Doc avec Travis" =>"Integration_continue.md",
	    #"Précompilation des modules"=>"Precompilation.md",
            #"Génération du rapport" => "generate_pdf.md",
            "Foire aux Questions" =>"FAQ.md"        
		
            ]
    )

deploydocs(
    repo   = "github.com/mathn7/Optinum.git",
    branch = "gh-pages",  
    devbranch = "master",
)
