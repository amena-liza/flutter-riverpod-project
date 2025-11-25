
https://chooyan.hashnode.dev/why-we-need-asyncvalue-of-riverpod

# In Riverpod's AsyncValue.when() method, the default values for the flags are:
skipLoadingOnRefreshing is true by default. This means that when data is being refreshed (typically via ref.refresh() or a pull-to-refresh action), the previous data remains visible, and the loading builder is not called, preventing a sudden "flash" of a loading indicator if there is already content to display.
skipLoadingOnReloading is false by default. This means that when a provider is rebuilt due to a dependency change (a "reload"), the loading builder is called, as the previous data may no longer be relevant to the new conditions.
These defaults aim to cover the most common use cases, such as keeping the UI stable during a pull-to-refresh operation while ensuring that significant data changes properly show a loading state. The behavior can be overridden by explicitly setting the flags as needed for specific UI requirements. 