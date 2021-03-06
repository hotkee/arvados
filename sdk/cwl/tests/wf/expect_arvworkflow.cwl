$graph:
- baseCommand: cat
  class: CommandLineTool
  id: '#submit_tool.cwl'
  inputs:
  - id: '#submit_tool.cwl/x'
    inputBinding: {position: 1}
    type: string
  outputs: []
  requirements:
  - {class: DockerRequirement, dockerPull: 'debian:8'}
- class: Workflow
  id: '#main'
  inputs:
  - id: '#main/x'
    type: string
  outputs: []
  steps:
  - id: '#main/step1'
    in:
    - {id: '#main/step1/x', source: '#main/x'}
    out: []
    run: '#submit_tool.cwl'
cwlVersion: v1.0
