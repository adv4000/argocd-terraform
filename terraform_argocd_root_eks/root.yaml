apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name     : root
  namespace: argocd
  finalizers:
  - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    name     : in-cluster
    namespace: argocd
  source:
    repoURL       : "${repoURL}"
    path          : "${path}"
    targetRevision: "${targetRevision}"
  project: default
  syncPolicy:
    automated:
      prune   : true
      selfHeal: true
      