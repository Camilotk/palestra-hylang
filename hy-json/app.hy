(import flask [Flask])
(import requests)

(setv app (Flask "__main__"))

(defn [(.get app "/")] 
	index [] "endpoints:<br>
	          /hy - dados da linguagem<br>
		  /temperature/city_name - dados<br>
		  /temperature/api/city_name - dados em JSON")

(defn [(.get app "/hy")] 
	about [] { "linguagem" "Hy" "data-criacao" 2013 })

(defn [(.get app "/temperature/api/<city_name>")] 
	temperature [city_name]
	(let [key "45f8ed0295ae206ca9f626b07bb55507"
	      geocoding f"http://api.openweathermap.org/geo/1.0/direct?q={city_name}&limit=5&appid={key}"
	      place (get (.json (requests.get geocoding)) 0)
	      latitude (get place "lat")
	      longitude (get place "lon")
	      url f"https://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={key}"
	      data (.json (requests.get url))]
	 data))

(defn template [city max min]
  f"<html><body>
  		<p><b>Nome da Cidade: </b>{city}</p>
		<p><b>Temperatura Máxima: </b>{max} ºC</p>
		<p><b>Temperatura Mínima: </b>{min} ºC</p>
	</body></html>")

(defn [(.get app "/temperature/<city_name>")] 
	view [city_name]
	(let [key "45f8ed0295ae206ca9f626b07bb55507"
	      geocoding f"http://api.openweathermap.org/geo/1.0/direct?q={city_name}&limit=5&appid={key}"
	      place (get (.json (requests.get geocoding)) 0)
	      latitude (get place "lat")
	      longitude (get place "lon")
	      url f"https://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={key}&units=metric"
	      data (.json (requests.get url))]
	  (template (get data "name") (get data "main" "temp_max") (get data "main" "temp_min"))))
	
(.run app :host "0.0.0.0" :port 5000)
