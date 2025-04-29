import {prismaClient} from "db/client"
export default async function Home() {
  const users = await prismaClient.user.findMany();
  return (
    <div >
      {JSON.stringify(users)}
    </div>
  );
}
// export const revalidate = 60; // this is the number of seconds to revalidate the page every 60 seconds because we are using server side rendering.
// export const dynamic = "force-static"; // this is to force the page to be static both of these works the same as they checkes for update in the file when there is an update in the database. 
