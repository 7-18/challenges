(defn remove_repeated_elements [data]
  (return (list (.fromkeys dict data))))

(defn combinations [data curr start end i r acc]
  (if (= r i)
    (do
      (.append acc (.join "" curr)))
    (do
      (if (and (<= start end) (>= (- end (+ start 1)) (- r i)))
        (do
          (.append curr (get data start))
          (combinations data curr (+ start 1) end (+ i 1) r acc)
          (if (or (= start end) (!= (get data start) (get data (+ start 1))))
            (do
              (combinations data (cut curr i) (+ start 1) end i r acc))
            (do
              (combinations data (cut curr i) (+ start 1) end i r acc))))
        (do
          (.append curr (get data start))
          (combinations data curr (+ start 1) end (+ i 1) r acc)
          (if (= (- r 1) (len curr))
            (do
              (.append acc (.join "" curr)))
            (do (return acc))))))))

(defn main []
  (setv test_case (.split (input)))
  (setv r (int (get test_case 0)))
  (setv n (int (len (get test_case 0))))
  (setv test_without_space (.join "" test_case))
  (setv data (cut test_without_space (+ n 2) (len test_without_space)))
  (setv curr [])
  (setv acc [])
  (setv res_with_repeated (combinations data curr 0 (len data) 0 r acc))
  (setv res (remove_repeated_elements res_with_repeated))
  (print (.join " " res)))

(main)
