# Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method
Some initial thoughs and corresponding work of applying optimizers and activation functions in potential-based path finding task.

For the report paper for this project, see [here](https://drive.google.com/file/d/1z-baPbQhgcbU4BF9MTtk8ipE8aZwfPiu/view?usp=sharing).

* "main_results.m" is the code for the essential part in the project paper, use this as a start.
* You can further use script "test_optimizer.m" to explore the optimizers. "test_plot_field.m" will give out the potential field and corresponding vector flow field of the maps.
* Optimizers can be found at "potential_planner.m"; combining CBFs and weighted combining CBFs using the ReLU function can be found at "clfcbf_control.m".
* You can also create you own map use "sphere_world_creater.m".


## Abstract
As a gradient-based method, the potential field method shares similar inner thoughts with the optimizer in deep learning field, which means we can apply some other optimizers in the potential field method instead of using the vanilla gradient descent method. In addition, with plenty of obstacles existing in the map, the constraints in CLF-CBF control can increase the calculation time, where we can also embrace the concept of activation function to compress multiple CBFs into one to enhance the calculation efficiency. 

In this paper, we demonstrate the applications of multiple well-known optimizers in convex optimization and deep learning to potential field method; we show a geometric mean based function that combines multiple CBF constraints into a single one by using "ReLU" activation function to accelerate the calculation speed. We compare the vanilla potential field method with optimizers of gradient descent with momentum, NAG, and Adam, and show the capability of mitigating the "bouncing problem" which may happen when using vanilla gradient descent by introducing the concept of momentum and friction. We also demonstrate that by combining multiple CBF constraints into one using the "ReLU" activation function, we can improve the calculation speed and even arrange weights when avoiding obstacles.



## Some result figures

### Paths for Optimizers

Paths for different optimizers. Row 1-4 are resulting paths for optimizers: vanilla gradient descent; gradient descent with momentum (heavy ball method); NAG; Adam. In each row, from left to right are map 1, 2 and 3.

![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/paths%20for%20optimizers.png)

### Geometric Combining CBFs using ReLU

Paths for geometric combining CBFs using ReLU.

Paths for maps, first row are paths with vanilla CLF-CBF for map 1-3; second row are paths with geometric combining CBFs for map 1-3. Paths chosen by vanilla CLF-CBF control are safer and smoother than the geometric combining CBFs method, while in geometric mean method, obstacles are combined and treated as a whole unit, thus the resulting paths may move along the boundaries of some obstacles.

![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/combining_cbfs.png)


Map 1 indexes (see "sphereworld1.mat").

![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/map1_idx.png)




Weighted Geometric Combining CBFs' paths for map 1. The weights w=[w1;w2;w3] used for the map from left to right are: [3;3;3], [3;2;3], [3;1;3]. Smaller weight pushes the path away from the corresponding obstacle (in our case, it's the one on the up-left, centered at [0;3]).

![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/map1_weighted_clfcbf.png)




Silk parameter's path correction.

![](https://github.com/GuoyaoShen/Application-of-Deep-Learning-Concept-in-Potential-Field-CLF-CBF-Method/blob/main/figs/weighted_clfcbf_correction.png)

