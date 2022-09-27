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

