(def input (clojure.string/split-lines
             (slurp "/Users/jeff/code/googlecodejam/test.txt")))

(def cases (read-string (first input)))

(def boards
  (map (fn [v] (map #(read-string %) v))
       (map #(clojure.string/split % #"\s+")
            (rest input))))

(defn game-maker [game-nums]
  (reduce (fn [acc coord] (assoc acc coord "."))
    {}
    (let [x (first game-nums)
          y (nth game-nums 1)]
      (for [xx (range x) yy (range y)]
        (vector xx yy)))))

(defn neighbors [coord]
  (let [x (first coord)
        y (last coord)]
    [[x y]
     [(- x 1) y]
     [(+ x 1) y]
     [x (- y 1)]
     [x (+ y 1)]
     [(- x 1) (- y 1)]
     [(+ x 1) (+ y 1)]
     [(- x 1) (+ y 1)]
     [(+ x 1) (- y 1)]]))

(neighbors [1 2])

(defn safe-cell? [coord game]
  (let [nabes (filter #(not (nil? %)) (map #(game %) (neighbors coord)))]
    (not (contains? (vec nabes) "*"))))


(safe-cell? [0 0] (game-maker (first boards)))

