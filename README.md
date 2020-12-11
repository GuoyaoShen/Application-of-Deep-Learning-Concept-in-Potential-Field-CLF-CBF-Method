# Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method
Some initial thoughs and corresponding work of applying optimizers and activation functions in potential-based path finding task.

For the report for this project, see [here](https://drive.google.com/file/d/1z-baPbQhgcbU4BF9MTtk8ipE8aZwfPiu/view?usp=sharing).

* "main_results.m" is the code for the essential part in the project paper.
* You can further use script "test_optimizer.m" to explore the optimizers. "test_plot_field.m" will give out the potential field and corresponding vector flow field of the maps.

### Abstract
As a gradient-based method, the potential field method shares similar inner thoughts with the optimizer in deep learning field, which means we can apply some other optimizers in the potential field method instead of using the vanilla gradient descent method. In addition, with plenty of obstacles existing in the map, the constraints in CLF-CBF control can increase the calculation time, where we can also embrace the concept of activation function to compress multiple CBFs into one to enhance the calculation efficiency. 

In this paper, we demonstrate the applications of multiple well-known optimizers in convex optimization and deep learning to potential field method; we show a geometric mean based function that combines multiple CBF constraints into a single one by using "ReLU" activation function to accelerate the calculation speed. We compare the vanilla potential field method with optimizers of gradient descent with momentum, NAG, and Adam, and show the capability of mitigating the "bouncing problem" which may happen when using vanilla gradient descent by introducing the concept of momentum and friction. We also demonstrate that by combining multiple CBF constraints into one using the "ReLU" activation function, we can improve the calculation speed and even arrange weights when avoiding obstacles.



### Some example results
![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/33_map3_normal.png)
![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/33_map3_relu.png)
![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/334_2_collision_recorrect.png)
