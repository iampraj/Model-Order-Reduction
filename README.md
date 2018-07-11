Model order reduction
=====================
Model order reduction (MOR) is a technique for reducing the computational complexity of mathematical models in numerical simulations. As such it is closely related to the concept of metamodeling with applications in all areas of mathematical modelling.

## Overview
Many modern mathematical models of real-life processes pose challenges when used in numerical simulations, due to complexity and large size (dimension). Model order reduction aims to lower the computational complexity of such problems, for example, in simulations of large-scale dynamical systems and control systems. By a reduction of the model's associated state space dimension or degrees of freedom, an approximation to the original model is computed which is commonly referred to as a reduced order model.

Reduced order models are useful in settings where it is often unfeasible to perform numerical simulations using the complete full order model. This can be due to limitations in computational resources or the requirements of the simulations setting, for instance real-time simulation settings or many-query settings in which a large number of simulations needs to be performed.[1][2] Examples of Real-time simulation settings include control systems in electronics and visualization of model results while examples for a many-query setting can include optimisation problems and design exploration. In order to be applicable to real-world problems, often the requirements of a reduced order model are:
* A small approximation error compared to the full order model.
* Conservation of the properties and characteristics of the full order model (E.g. stability and passivity in electronics).
* Computationally efficient and robust reduced order modelling techniques.

## Methods
Model order reduction techniques used most commonly nowadays can be broadly classified into 4 classes: 
* Proper orthogonal decompostion methods
* Reduced basis methods
* Balancing methods
* simplified physics or operational based reduction methods

The simplified physics approach can be described to be analogous to the traditional Mathematical modelling approach, in which a less complex description of a system is constructed based on assumptions and simplifications using physical insight or otherwise derived information. However, this approach is not often the topic of discussion in the context of model order reduction as it is a general method in science, engineering and mathematics and is not the subject of the current article.

The remaining listed methods fall into the category of projection-based reduction. Projection-based reduction relies on the projection of either the model equations or the solution onto a basis of reduced dimensionality compared to the original solution space. Methods that also fall into this class but are perhaps less commonly found are:
* Proper generalized decomposition
* Matrix interpolation
* Transfer function interpolation
* Piecewise tangential interpolation
* Loewner framework
* (Empirical) cross Gramian
* Krylov subspace methods

## Applications
Model order reduction finds application within all fields involving mathematical modelling and many reviews exist for the topics of electronics, fluid- and structural mechanics.

## Fluid mechanics
Current Problems in fluid mechanics involve large dynamical systems representing many effects on many different scales. Computational fluid dynamics studies often involve models solving the navier-stokes with a number of degrees of freedom in the order of magnitude upwards of {\displaystyle 10^{6}} 10^{6}. The first usage of model order reduction techniques dates back to the work of Lumley in 1967 where it was used to gain insight into the mechanisms and intensity of turbulence and large coherent structures present in fluid flow problems. Model order reduction also finds modern applications in Aeronautics to model the flow over the body of aircraft. An example can be found in Lieu et al in which the full order model of an F16 fighter-aircraft with over 2.1 million degrees of freedom, was reduced to a model of just 90 degrees of freedom. Additionally reduced order modelling has been applied to study rheology in Hemodynamics and the Fluid–structure interactionbetween the blood flowing through the vascular system and the vascular walls.