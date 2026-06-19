 Product OS: A Framework for Coherent Software Design
13 sources·May 22, 2026

These sources document the conceptual birth and framework of Product OS, a specialized methodology for building coherent software without a traditional design team. The text begins with a real-world product rescue scenario, where a developer seeks advice on transforming a fragmented UI into a unified enterprise control plane. The provided guidance emphasizes that product modeling, clear terminology, and defined user journeys are more vital than visual aesthetics. This approach is then expanded into a repeatable cookbook that synthesizes established business strategies like Lean Startup and Shape Up. Ultimately, the sources advocate for a disciplined, text-based workflow that uses structured specifications to replace manual design tools.
How do I build a coherent product without using Figma?
Explain the stages of the Product Development Operating System.
How can I distinguish between configuration and operations UX?
Today • 11:35 PM

Explain the stages of the Product Development Operating System.
The Product Development Operating System (Product OS) is a repeatable, AI-native system designed to turn vague ideas into coherent, buildable software by providing structure to solo developers. It enforces a disciplined workflow that prevents common failure modes like "premature coding" or "feature creep".
The full operating system consists of a 17-stage "cookbook" that moves a product through discovery, definition, design, delivery, and learning.
Phase 1: Discovery (Solving for Uncertainty)
These stages ensure you are solving a real problem worth the investment before writing code.

    Idea Capture: Converts a vague idea into a concrete one-page Idea Brief that identifies the problem, the target audience, and the "why now".
    Assumption Mapping: Identifies high-risk assumptions regarding desirability, viability, and feasibility that could potentially "kill" the project.
    Customer Discovery: Uses principles like "The Mom Test" to understand actual past user behaviors and real pains rather than gathering opinions on future solutions.
    Opportunity Mapping: Structures research findings into an Opportunity Solution Tree to visualize which user problems are worth solving first.

Phase 2: Definition (Defining the Internal World)
These stages formalize how the product behaves and how it is organized. 5.  Product Positioning: Defines the product's category and primary promise while explicitly stating non-goals to prevent sprawl. 6.  Product Model: Defines the core domain objects (e.g., "Pipeline Definition" vs. "Deployment"), their states, and their relationships. 7.  Journey Mapping: Outlines the essential paths users must complete successfully, defined by triggers, entry points, and completion criteria. 8.  Information Architecture (IA): Organizes the product's objects and actions into a coherent screen hierarchy and navigation system.
Phase 3: Design (Creating a Bounded Blueprint)
This phase focuses on defining the solution and ensuring visual and functional coherence. 9.  Shaping: Uses "Shape Up" principles to turn broad ideas into bounded, buildable projects with a specific "appetite" (time budget). 10. Screen Specs: Replaces Figma with text-based specifications for each screen, defining its purpose, layout, required data, and all possible states (loading, empty, failed, etc.). 11. Interaction Design Rules: Establishes global rules for how actions like "save," "deploy," or "delete" behave across the entire app. 12. UI System: Creates a small, opinionated system of reusable layouts and components to ensure visual coherence.
Phase 4: Delivery (Execution)

    Technical Architecture: Ensures the code implementation matches the product domain model (e.g., if the model has a "Draft" concept, the code must reflect it).
    Build: Implements the shaped feature slice end-to-end according to a readiness checklist.

Phase 5: Learning (Closing the Loop)

    Usability Testing: Lightweight tests to see if a real user can complete a journey without external explanation.
    Instrumentation (Measure): Sets success metrics and plans analytics events to gather evidence of what users actually did after launch.
    Retrospective (Reflect): A formal review of evidence to decide whether to continue, improve, simplify, pivot, or kill the feature.

Special Tracks and Depth Tiers

    Existing Product (Audit): If working on an existing codebase, the system starts with a Product Audit to analyze what is currently there before reconciling it with the desired target state in the Product Model stage.
    Depth Tiers: Every stage can run as a "Lite" tier (3–5 essential questions for fast validation) or a "Pro" tier (8–15 full questions for team-facing documentation).
    Artifact Types: The system distinguishes between living definitions (like the Glossary or IA), which are updated as the product evolves, and point-in-time decisions (like Pitches and Retrospectives), which remain immutable records of a moment in time.

How do I choose between Lite and Pro depth tiers?
What is the Product Audit for existing products?
Tell me more about the 17-stage cookbook recipes.

Can you research attached materials and other sources on the internet for me so that we can create and summarize all relevant techniques
Based on the provided materials, the following is a comprehensive summary of relevant techniques used in modern, AI-native product development and discovery. These techniques are designed to provide structure to solo builders and teams, ensuring that software remains coherent and solves real-world problems.
1. Discovery and Validation Techniques
These methods focus on reducing uncertainty and "value risk" before a single line of code is written.

    The Mom Test: A technique for customer discovery that involves asking about past behaviors rather than future opinions. It teaches you to avoid leading questions that result in fake validation (e.g., "Would you use this?") and instead focus on real problems users have already tried to solve.
    Opportunity Solution Trees (OST): A visual framework that connects a desired business outcome to synthesized user opportunities (pains/needs), potential solutions, and the experiments used to validate them. It prevents teams from jumping to solutions before mapping the real problem space.
    Jobs to Be Done (JTBD): A framework that focuses on the "progress" a user is trying to make in a specific circumstance. It uses the metaphor that users "hire" a product to do a job, allowing developers to focus on the desired outcome rather than just a list of features.
    Assumption Mapping: The process of identifying and plotting desirability, viability, and feasibility assumptions on a grid to determine which high-risk unknowns could "kill" the project if proven wrong.
    Solution Experimentation (MVP): Moving away from building a "buggy version" of a grand vision to designing the smallest possible experiment to test a core hypothesis. Techniques include Landing Page Tests to gauge interest via email signups and Explainer Videos to demonstrate concepts before implementation.

2. Definition and Architecture Techniques
These techniques define the "internal world" of the product to prevent "consistent incoherence" as the codebase grows.

    Product Model: Formally defining the core domain objects, their relationships, and their lifecycle states (e.g., distinguishing between a "Pipeline Definition" and a "Pipeline Deployment").
    Aggressive Terminology (Glossary): Establishing a single source of truth for terms used in the UI, code, and documentation to prevent drift.
    Information Architecture (IA): Organizing the product's objects and actions into a predictable screen hierarchy and navigation system so users always know where they are.
    Product Positioning: Defining the product category and the primary promise while explicitly stating non-goals to prevent feature sprawl.

3. Design and Shaping Techniques
These techniques create a bounded blueprint that bridges the gap between a vague idea and executable code.

    Shaping (Shape Up): Turning a broad idea into a bounded project with a specific "appetite" (time budget). It focuses on defining the solution at a level of fidelity that is "rough" enough for engineers to solve the details but "concrete" enough to be built within a fixed window.
    Screen Specs: A text-based alternative to Figma for solo developers. Each spec defines the screen's purpose, the primary user question it answers, required data, layout rules, and all possible states (empty, loading, failed, etc.).
    User Story Mapping: A collaborative technique for sequencing user activities over time to discover how a set of tasks creates a complete experience.
    Interaction Design Rules: Establishing global rules for how actions like "save," "delete," or "deploy" behave consistently across the entire application.

4. Delivery and Execution Techniques
These methods focus on maintaining quality and speed through disciplined human-agent partnerships and solo workflows.

    Agentic-Agile: A methodology that treats AI agents as team members rather than just tools. It uses Contract-Driven Execution, where agents operate against structured specifications and issues rather than open-ended prompts.
    Spec-First Backlog: Mandating that no work is committed without an associated issue that includes clear Acceptance Criteria to act as a contract for agent execution.
    Peer and Auto Code Reviews: Solo developers are encouraged to use Auto Code Review, where they inspect their own code with "fresh eyes" after a break. For higher stakes, Peer Reviews with a supervisor or colleague help catch architectural violations early.
    Build Readiness Checklist: A final gate before writing code to ensure the domain model exists, instrumentation is planned, and glossary terms are used correctly.

5. Growth and Learning Techniques
These closing loops ensure the product continues to provide value after launch.

    The "Aha!" Moment: Identifying the specific, measurable event where a user first experiences the product's core value (e.g., Slack's "Aha!" is sending 2,000 team messages).
    Product Kata: A systematic problem-solving loop where you understand the direction, analyze the current state, set a target goal, and then experiment to reach it.
    Outcome-Based Roadmaps: Replacing lists of features with a portfolio of "bets" on specific user problems to solve, measured by whether they move the "metrics that matter".
    Product-Qualified Leads (PQLs): In a product-led growth model, identifying users who have hit key value milestones and are showing signals that they are ready for an upgrade or sales conversation.

How do I create a Product Model for my app?
What are the best methods for running lean validation experiments?
How can I identify the 'Aha!' moment for my product?

How do I create a Product Model for my app?
Creating a Product Model is the stage in the Product Development Operating System where you formalize your app's "internal world". It is the converging point for both the "New Product" and "Existing Product" tracks; whether you are starting from a fresh discovery or a codebase audit, you must reconcile what you have with what the product should be.
The goal is to define your core objects, states, and terminology before you ever design a screen or write a line of code, preventing the "Frankenstein" effect where a product grows without a spine.
1. Identify Core Domain Objects
Start by defining the primary "nouns" of your application. You must be precise about what these objects mean to prevent user confusion later.

    Example: In a data pipeline app, you would clearly separate a Pipeline Draft (the current work-in-progress) from a Pipeline Deployment (the actual running instance).
    Key Question: What are the core objects, and how do they relate to each other?.

2. Define Lifecycle States
Enterprise-grade software lives or dies by its states. You need a consistent "state language" that maps backend data to clear UI statuses.

    Categories: Define visual and language rules for states like Healthy, Degraded, Failed, Draft, and Out of Sync.
    Rule: Never show raw backend states directly; create a UI status model that the user can actually understand.

3. Aggressive Terminology (The Glossary)
Establish a single source of truth for every term used in the UI, code, and documentation.

    Enforcement: Once defined, these terms must be enforced across component names, route names, and AI prompts.
    Example: Decide whether to call a data endpoint a "Source" or a "Kafka Stream" and stick to it.

4. Information Architecture (IA)
Map out where every object, action, and screen lives in a coherent hierarchy.

    Structure: Organize your app into predictable categories like Overview, Resources, Deployments, and Operations.
    Exit Condition: You are done when every planned screen has a defined "home" in the navigation.

5. Product Positioning and Non-Goals
Explicitly state what your product is—and, more importantly, what it is not.

    Non-Goals: Identifying what is out of scope prevents "feature sprawl" that causes apps to collapse under their own weight.

Execution: The AI-Native Workflow
In the Product OS, you don't write these documents manually. Instead, you use the product:model skill:

    Invoke the skill: Run product:model in your terminal.
    Repo-Aware Interview: The AI reads your existing discovery notes or audit findings and interviews you on what is missing.
    Produce Artifacts: The system generates three living documents: product-model.md, glossary.md, and information-architecture.md.
    Choose Depth: Use the Lite tier (3–5 essential questions) for fast validation on personal projects, or the Pro tier (8–15 questions) for team-facing documentation.

Exit Condition: You are finished with this stage when you can draw the product's object model on a whiteboard. If you cannot explain the relationships between your app's core objects, the UI will inevitably be incoherent.
