(use data-generators test test-generative)


(test-group "group around"


            (test-group "with failing probably assertions"
                        (test-generative ((number (gen-fixnum))
                                          (string (gen-string-of (gen-char #\a #\z))))
                                         ;; (test "error" #t (error "foo"))
                                         (test-assert (> (string-length string) 30))
                                         (test-assert ((constantly #t)))))
            (test-group "all passing"
                        (test-generative ((number (gen-fixnum)))
                           (test-assert (number? number)))))


(test-exit)