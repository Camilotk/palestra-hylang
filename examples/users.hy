(require hyrule [->> ap-reduce])

; Define uma lista de mapas de usuários
(setv users [{:name "Alice" :age 25}
            {:name "Bob" :age 30}
            {:name "Charlie" :age 35}
            {:name "Dave" :age 42}])

; Retorna a média de valor das idades
(defn average-age [users]
   (let [num-users (len users)
         total-age (->> users
                        (map (fn [user] (get user :age)))
                        (ap-reduce (+ it acc)))]
    (/ total-age num-users)))

; Retorna uma lista de usuários mais velhos que a média
(defn users-older-than-average [users]
  (let [avg-age (average-age users)]
    (list (filter (fn [user] (> (get user :age) avg-age)) users))))

; Função para printar bonitinho os dados
(defn print-each-user [users]
    (list (map 
           (fn [user] 
             (print "Name: " (get user :name) "-" "Age:" (get user :age))) 
           users)))

; Output
(print "average: " (average-age users))
(print-each-user (users-older-than-average users))