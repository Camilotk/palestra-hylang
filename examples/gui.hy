(import tkinter :as tk)

(setv root (.Tk tk))
(.geometry root "400x300")
(.title root "Example GUI with Hy")

(setv message (tk.Label root :text "Hello GUI" :font "Arial 40 bold"))
(.pack message :padx 50 :pady 50)

(.mainloop root)
