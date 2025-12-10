<funcion> ::= <nombre_funcion> "::=" <dominio> "->" <rango> | <nombre_funcion> "::=" <clase_de_tipo> "=>"<dominio> "->" <rango>

<nombre_funcion> ::= <minús>|<minús><símbolos>

<minús> ::= (a|...|z) | (a|...|z)<minús>

<símbolos> ::= <minús><símbolos> | <mayús><símbolos> | <dígitos><símbolos> | "_"<símbolos>

<mayús> ::= (A|...|Z) | (A|...|Z)<mayús> 

<dígitos> ::= (0|...|9) | (0|...|9)<dígitos>

<clase_de_tipo> ::= "("<nombre_clase>")"

<nombre_clase> ::= <tipo_reservado><tipo_abstracto> | <tipo_reservado><tipo_abstracto>"," <nombre_clase>

<tipo_reservado> ::= ("Eq"|"Ord"|"Num") -- los que sé

<tipo_abstracto> ::= (a|b|c|d|...|e) -- primeras letras

<dominio> ::= <conjunto_simple> | <conjunto_simple> "->" <dominio>

<conjunto_simple> ::= <tipo_abstracto> | <tipo_concreto> | <funcion> | <estructuras>

<tipo_concreto> ::= Int | Char | String | Bool | Float | Double | Integral

<función> ::= "("<dominio>"->"<rango>")"

<estructuras> ::= <listas> | <tuplas> | <estructura_definida>

<listas> ::= "["<listas>"]" | "["<elementos_de_lista>"]"

<elementos_de_lista> ::= <conjunto_simple> "," <elementos_de_lista> | <conjunto_simple>  

<tuplas> ::= "("<tuplas>")" | "("<elementos_de_lista>")"

<estructura_definida> ::= <mayús> | <mayús><símbolos>

<rango> ::= <conjunto_simple> -- No sé si hay restricciones para funciones en el rango