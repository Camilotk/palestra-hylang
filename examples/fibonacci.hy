(require hyrule [loop])

(defn factorial [n]
  (loop [[i n] [acc 1]]
    (if (= i 0)
      acc
      (recur (- i 1) (* acc i)))))