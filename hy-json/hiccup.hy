(defn princ 
   [the-string]
   (print #* [the-string] :end "")
   "")

(defn print-tag 
   [name closingp attrs]
   (princ "<")
   (when closingp 
      (princ "/"))
    (princ (.lower name))
    (when (and attrs (not closingp))
      (do 
         (princ " " )
         (lfor [key value] (.items attrs)
           (princ (+ (str key) "=" "'" (str value) "'")))))
    (princ ">"))

(defmacro tag [name attrs body]
  `(do
     (print-tag ~name False ~attrs)
     (princ  (.join "" (list (map (fn [tag] (if (= (type tag) str) tag `(str tag))) ~body))) )
     (print-tag ~name True {})))

(defmacro html
  [attrs body]
  `(tag "html" ~attrs ~body))

(defmacro body
  [attrs body]
  `(tag "body" ~attrs ~body))

(defmacro head
  [attrs body]
  `(tag "head" ~attrs ~body))

(defmacro p
  [attrs body]
  `(tag "p" ~attrs ~body))

(defmacro b
  [attrs body]
  `(tag "b" ~attrs ~body))

(defmacro br 
   [] 
   `(print-tag "br" False {}))

(defmacro h1
  [attrs body]
  `(tag "h1" ~attrs ~body))

(defn template-weather [city max min]
    (let [html (do (print-tag "body" False {})
                   (p {} (do (b {} "Nome da Cidade: ") city))
                   (p {} (do (b {} "Temperatura Máxima: ") (+ (str max) " ºC" )))
                   (p {} (do (b {} "Temperatura Mínima: ") (+ (str min) " ºC" )))
                   (print-tag "body" True {}))]
    html))

(template-weather "Caxias do Sul" 18.23 20.4)
(print)