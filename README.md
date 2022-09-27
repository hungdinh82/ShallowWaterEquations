Introduction
In this project, the author simulates waves using MATLAB [1] and the shallow water equations (SWEs) in
a variety of environments, from droplets in a bathtub to tsunamis in the Pacific. The SWEs are used to
model waves, especially in water, where the wavelength is significantly larger than the depth of the
medium. The SWEs are especially useful for modeling tsunamis. While one might not normally consider
the 4km average depth of the Pacific Ocean to be “shallow water”, the SWEs are still valid when applied
to tsunamis which can have wavelengths in excess of 100km [2].
The SWEs are derived from the Navier-Stoke equations. The assumption made during the derivation is
that the vertical velocity is small enough to be considered negligible. While an uneven seafloor does
cause a vertical acceleration (beyond that of gravity), the vertical velocity is still negligible when
compared to tsunamis which can travel in excess of 700 km/hr [2]. The vertical velocity of tsunami
waves is most relevant when the wave approaches the shoreline. The steep incline of the continental
rise at the coast is what gives tsunamis their great height. Many have described approaching tsunamis as
not a wave but a wall of water. The goal of this project is to model the global propagation and
reflections of tsunamis, not their effect on coastal regions. Because of this, the edges of land masses will
be treated as perfect boundaries and the effect of continental selves and rises can be safely neglected.
Conclusion
The project was mostly a success. Regrettably, I was unable to add landmasses to the spherical model
before the project deadline. The spherical model is also quite unstable because the entire sphere is
treated as a moldable object whereas the Earth’s crust would prevent this behavior in a real world
scenario. The spherical model is also just a simple projection of the rectangular model onto a spherical
surface. It would be interesting, albeit time consuming, to rederive the Shallow Water Equations in
spherical coordinates from the original Navier-Stokes equations. Using true spherical coordinates would
provide a much better model, but at that point, MATLAB is probably no longer the best tool for the job.
References
[1] "How Do Tsunamis Differ from Other Water Waves?" Earth and Space Sciences at the University
of Washington. Web. <http://www.ess.washington.edu/tsunami/general/physics/characteristics.html>.
[2] MATLAB. Vers. 2011b. Natick, MA: MathWorks, 2011. Computer software.
[3] Moler, Cleve. "Chapter 18: Shallow Water Equations." Experiments with MATLAB. MathWorks.
Web. <http://www.mathworks.com/moler/exm/chapters.html>.
[4] Garc´ıa-Navarr, P. "The Shallow Water Equations: An Example of Hyperbolic System." Fluid
Mechanics. CPS. University of Zaragoza (2008). <http://iuma.unizar.es/maths_water/Actas/089.pdf>.
[5] Rifle, Guillaume. "A Shallow Water Numerical Model V0 . 1." Fluid Mechanics. CPS. University of
Zaragoza (2006). Web. <http://www.scribd.com/doc/2022736/ShallowWater0-2>.
