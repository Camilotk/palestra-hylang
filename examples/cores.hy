(import pygame)

(setv cols ["#FF0000" "#FF7F00" "#FFFF00" "#00FF00" "#0000FF" "#8B00FF"])

(print cols)

(setv width 700)
(setv height 500)
(setv y (/ height 6))

(setv display (.set_mode pygame.display #(width height)))

; Cria as colunas
(list (map (fn [item]
       (display.fill (pygame.Color (get item 1)) 
                    :rect [0 (* (get item 0) y) width (* y (+ (get item 0) 1))]))
      (list (enumerate cols))))

; Atualiza a tela
(pygame.display.flip)

; Salva a imagem criada
(pygame.image.save display "arco-iris.png")