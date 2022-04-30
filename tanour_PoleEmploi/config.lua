Config = {

PoleEmploi = {
    {x = -268.81, y = -956.35, z = 31.22}
},
Tacos = {
    {x = -1246.69, y = -1472.14, z = 4.25}
},
TacosLivraison = {
    {x = 806.37, y = 2181.33, z = 52.25}
},
Jardinier = {
    {x = 2435.48, y = 5012.60, z = 46.87}
},
JardinierRecolte = {
    {x = 2816.81, y = 4587.98, z = 45.66}
},


Ped = {
    {position = vector4(-269.21, -955.45, 30.22, 197.77), pedModel = "a_f_y_femaleagent"}, -- Ped Pôle Emploi
    {position = vector4(-1247.49, -1472.81, 3.3, 312.70), pedModel = "a_m_m_afriamer_01"}, -- Ped Tacos
    {position = vector4(805.29, 2181.84, 51.22, 245.59), pedModel = "a_m_m_afriamer_01"}, -- Ped TacosLivraison
    {position = vector4(2434.89, 5012.00, 45.84, 308.70), pedModel = "a_m_y_vindouche_01"},-- Ped Jardinier
    
},


Libre = {
    {label = "Tacos", name = "tacos", objectif = "Tu vas livrer des tacos", message = "~o~Rends toi là-bas, ton patron t'attend", x = -1247.49, y = -1472.81, z = 3.3},
    {label = "Jardinier", name = "jardinier", objectif = "Tu vas récolter des plantes", message = "~o~Rends toi là-bas, ton patron t'attend", x = 2435.76, y = 5012.00, z = 45.84},
},
Whitelist = {
    {label = "Brasseur", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement", message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Burgershot", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement",  message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Concessionnaire", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Ems", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Mécano", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Orpailleur", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Police", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Tabac", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Unicorn", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
    {label = "Vigneron", Title = "Pôle Emploi", SubTitle = "~b~Tokyo Développement" , message = "Pour être recruter, il faut faire ta candidature sur le discord : ~b~discord.gg/PKHRT8pQC4"},
},

PrixLivraisonTacos = 400,
PrixVenteJardinier = 16,

---- Blips ----

BlipsPoleEmploi = true, 
BlipsPoleEmploiName = 'Pôle Emploi', 
BlipsPoleEmploiId = 269, 
BlipsPoleEmploiTaille = 1.0, 
BlipsPoleEmploiCouleur = 38, 

BlipsTacos = true, 
BlipsTacosName = ' Tacos', 
BlipsTacosId = 480, 
BlipsTacosTaille = 0.6, 
BlipsTacosCouleur = 64,

BlipsJardinier = true, 
BlipsJardinierName = ' Jardinier', 
BlipsJardinierId = 480, 
BlipsJardinierTaille = 0.6, 
BlipsJardinierCouleur = 25,


BlipsPoleEmploiPosition = {
    {x = -265.20, y = -963.53, z = 31.22}
},
BlipsTacosPosition = {
    {x = -1246.69, y = -1472.14, z = 4.25}
},
BlipsJardinierPosition = {
    {x = 2435.48, y = 5012.60, z = 46.87}
},    

---- Marker ----

MarkerType = 22, 
MarkerSizeLargeur = 0.3, 
MarkerSizeEpaisseur = 0.3,
MarkerSizeHauteur = 0.3,
MarkerDistance = 5.0,
MarkerColorR = 12, 
MarkerColorG = 203, 
MarkerColorB = 238, 
MarkerOpacite = 255, 
MarkerSaute = true, 
MarkerTourne = true, 


---- Text ---- 

TextDistance = 2.0,
Text = "Appuyez sur [~b~E~s~] pour accèder au ~b~pôle emploi", 
TextTacos = "Appuyez sur [~b~E~s~] pour ~b~parler à ton patron", 
TextTacosLivraison = "Appuyez sur [~b~E~s~] pour ~b~livrer ta commande",
TextJardinier = "Appuyez sur [~b~E~s~] pour ~b~parler à ton patron",
TextJardinierRecolte = "Appuyez sur [~b~E~s~] pour ~b~récolter des plantes",

}