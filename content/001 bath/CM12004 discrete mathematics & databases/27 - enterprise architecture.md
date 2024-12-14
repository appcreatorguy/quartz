#lecture
# 27 - enterprise architecture
class: [[CM12004]]
topics mentioned: #databases #sql #cloud
date: 2024-12-06
teacher: [[Andy Barnes]]
## integrity checking
[[|previously]], we saw how [[DDL statements]] allowed us to protect our database from out-of-domain data. the issue with this is that if the data is incorrect, the error needs to propagate backwards from the [[database]], which can take time.
instead, we take a 'no-trust' approach to data, and add integrity checks to every level of the stack.
## cloud computing
most organisations will not store [[database]]s in local files, and will instead rely on cloud-based solutions. this means that the organisation does not need to know or care where the service physically resides.
