import { Container } from "../components/Container";

import React from "react";
import Link from "next/link";

export function Hero() {
  return (
    <Container className="pt-20 pb-16 text-center lg:pt-32 -mt-16">
      <h1 className="mx-auto max-w-4xl font-display text-5xl font-medium tracking-tight text-slate-900 sm:text-7xl">
        Join{" "}
        <span className="relative whitespace-nowrap text-[#bb0059]">
          <span className="relative">our Amazing Vesting</span>
        </span>{" "}
        Platform for your Firm.
      </h1>

      <div className="mt-10 flex justify-center space-x-6 ">
        <Link
          href="/create"
          className="bg-[#bb0059] text-white px-4 py-2 rounded-lg"
        >
          Create Company
        </Link>
      </div>
    </Container>
  );
}
