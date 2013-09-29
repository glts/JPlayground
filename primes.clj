(defn divis? [n d]
  (zero? (mod n d)))

; A naive, recursive prime factorization function.
(let [memo (atom {2 [2] 3 [3]})
      memoizing (fn [k v] (if (< k 1e5) (swap! memo assoc k v)) v)]
  (defn primef
    "Returns a seq (TODO type?) with the prime factors of n. The results
     for n < 10000 are cached, they will be computed only once."
    [n]
    (if-let [p (get @memo n)]
      p
      (if (even? n)
        (memoizing n (sort (conj (primef (quot n 2)) 2)))
        (loop [x (quot n 2)]
          (cond
            (= 1 x) (memoizing n [n])
            (divis? n x) (memoizing n (sort (into (primef (quot n x)) (primef x))))
            true (recur (dec x))))))))

; XXX Problem: when I create lots of prime factors in a seq,
; everything comes to a grinding halt. Why?
;       (nth (map #(primef %) (iterate inc 2)) 100000)
; On the other hand specific queries are fast:
;       (pmap #(primef %) (range 1256777 1256781))

(defn prime? [n]
  (= 1 (count (primef n))))

; see also https://kotka.de/blog/2010/03/The_Rule_of_Three.html

; TODO improve algorithm, write test, benchmark
