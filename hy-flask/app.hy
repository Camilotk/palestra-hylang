(import flask [Flask])

(setv app (Flask "__name__"))

(defn [(app.route "/")] 
	index [] {"message" "Hello Flask!"})

(app.run :host "0.0.0.0" :port 5000)
