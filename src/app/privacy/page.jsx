import React from "react";

export const metadata = {
    title: "Privacy Policy | Swift Speak",
    description: "Privacy Policy for the Swift Speak application.",
};

export default function PrivacyPolicyPage() {
    return (
        <div className="container mx-auto px-4 py-12 max-w-4xl">
            <h1 className="text-4xl font-bold mb-8 text-foreground">Privacy Policy</h1>

            <div className="prose dark:prose-invert max-w-none space-y-6 text-muted-foreground">
                <p>
                    Last updated: {new Date().toLocaleDateString()}
                </p>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">1. Introduction</h2>
                    <p>
                        Welcome to <strong>Swift Speak</strong>. We respect your privacy and are committed to protecting your personal data.
                        This privacy policy will inform you as to how we look after your personal data when you visit our application
                        and tell you about your privacy rights and how the law protects you.
                    </p>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">2. Data We Collect</h2>
                    <p>
                        We may collect, use, store and transfer different kinds of personal data about you which we have grouped together follows:
                    </p>
                    <ul className="list-disc pl-6 space-y-2 mt-2">
                        <li><strong>Identity Data:</strong> includes first name, last name, username or similar identifier.</li>
                        <li><strong>Contact Data:</strong> includes email address.</li>
                        <li><strong>Usage Data:</strong> includes information about how you use our app.</li>
                        <li><strong>Device Data:</strong> includes internet protocol (IP) address, your login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform and other technology on the devices you use to access this app.</li>
                    </ul>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">3. How We Use Your Data</h2>
                    <p>
                        We will only use your personal data when the law allows us to. Most commonly, we will use your personal data in the following circumstances:
                    </p>
                    <ul className="list-disc pl-6 space-y-2 mt-2">
                        <li>To provide and maintain the Service.</li>
                        <li>To manage your account and authentication (e.g., via Firebase/Google Sign-In).</li>
                        <li>To improve our application and user experience.</li>
                    </ul>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">4. Third-Party Services</h2>
                    <p>
                        We may employ third-party companies and individuals due to the following reasons:
                    </p>
                    <ul className="list-disc pl-6 space-y-2 mt-2">
                        <li>To facilitate our Service;</li>
                        <li>To provide the Service on our behalf;</li>
                        <li>To perform Service-related services; or</li>
                        <li>To assist us in analyzing how our Service is used.</li>
                    </ul>
                    <p className="mt-2">
                        <strong>Google Firebase:</strong> We use Google Firebase for authentication and database services.
                        You can read their Privacy Policy <a href="https://firebase.google.com/support/privacy" target="_blank" rel="noopener noreferrer" className="text-primary hover:underline">here</a>.
                    </p>
                    <p className="mt-2">
                        <strong>Google Gemini API:</strong> We use Google Gemini API for AI-powered features.
                        Data processed by the AI model is subject to Google's <a href="https://policies.google.com/privacy" target="_blank" rel="noopener noreferrer" className="text-primary hover:underline">Privacy Policy</a>.
                    </p>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">5. Data Security</h2>
                    <p>
                        We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it.
                        But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable,
                        and we cannot guarantee its absolute security.
                    </p>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">6. Children's Privacy</h2>
                    <p>
                        These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13.
                        In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers.
                        If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.
                    </p>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">7. Changes to This Privacy Policy</h2>
                    <p>
                        We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes.
                        We will notify you of any changes by posting the new Privacy Policy on this page.
                    </p>
                </section>

                <section>
                    <h2 className="text-2xl font-semibold text-foreground mb-4">8. Contact Us</h2>
                    <p>
                        If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.
                    </p>
                </section>
            </div>
        </div>
    );
}
